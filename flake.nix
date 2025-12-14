{
  description = "hasrthur's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    configuration = { pkgs, lib, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      # environment = {
      #   variables = {
      #     EDITOR = "vim";
      #   };
      # };

      fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

      # # Auto upgrade nix package and the daemon service.
      # services.nix-daemon.enable = true;

      nix = {
        checkConfig = true;
        gc.automatic = true;
        # gc.user = "root";
        optimise.automatic = true;
        settings = {
          experimental-features = [ "nix-command" "flakes" ];
          trusted-users = [ "root" "artur" ];
        };
        extraOptions = ''
          extra-platforms = x86_64-darwin aarch64-darwin
        '';
      };

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina

      system = {
        primaryUser = "artur";
        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 6;
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;

        defaults = { 
          CustomUserPreferences = {
            ActivityMonitor = {
              IconType = 5; # CPU Usage
            };
            NSGlobalDomain = {
              AppleInterfaceStyle = "Dark";
              AppleShowAllExtensions = true;
              AppleShowAllFiles = true;
              NSAutomaticCapitalizationEnabled = false;
              # NSAutomaticSpellingCorrectionEnabled = false;
              NSTableViewDefaultSizeMode = 2;
              "com.apple.mouse.tapBehavior" = 1;
              "com.apple.trackpad.scaling" = 2;
              # Add a context menu item for showing the Web Inspector in web views
              WebKitDeveloperExtras = true;

              "com.apple.finder" = {
                ShowExternalHardDrivesOnDesktop = true;
                ShowHardDrivesOnDesktop = true;
                ShowMountedServersOnDesktop = true;
                ShowRemovableMediaOnDesktop = true;
                _FXSortFoldersFirst = true;
                # When performing a search, search the current folder by default
                FXDefaultSearchScope = "SCcf";
              };
              "com.apple.desktopservices" = {
                # Avoid creating .DS_Store files on network or USB volumes
                DSDontWriteNetworkStores = true;
                DSDontWriteUSBStores = true;
              };
            };
          };
          finder = {
            AppleShowAllFiles = true;
            FXEnableExtensionChangeWarning = false;
            FXPreferredViewStyle = "clmv";
            ShowPathbar = true;
            ShowStatusBar = true;
            _FXShowPosixPathInTitle = true;
          };
          menuExtraClock = { 
            IsAnalog = false;
            Show24Hour = true;
            ShowDate = 1;
          };
          trackpad = {
            TrackpadThreeFingerDrag = true;
          };
        };
      };

      # The platform the configuration will be used on.
      nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config = { allowUnfree = true; 
                   allowUnsupportedSystem = true; };
      };

      # Unlocking sudo via fingerprint
      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Arturs-Laptop
    darwinConfigurations."Arturs-Laptop" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        inputs.home-manager.darwinModules.home-manager
        {
          users.users.artur.home = "/Users/artur";
          
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          
          home-manager.users.artur.imports = [
            ./home.nix
          ];
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Arturs-Laptop".pkgs;
  };
}
