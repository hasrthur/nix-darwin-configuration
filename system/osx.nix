{ inputs, config, ... }:

{
  system = {
    primaryUser = config.username;
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;
    # Set Git commit hash for darwin-version.
    configurationRevision = inputs.rev or inputs.dirtyRev or null;

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
          NSAutomaticSpellingCorrectionEnabled = false;
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

  security.pam.services.sudo_local.touchIdAuth = true;
}
