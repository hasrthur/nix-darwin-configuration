{ config, pkgs, lib, inputs, ... }:

{
  config = {
    users.users.${config.username}.home = "/Users/${config.username}";
    
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    
    home-manager.users.${config.username} = {
      home.stateVersion = "24.05";

        imports = [
          ./home-manager
        ];

        # This is to ensure programs are using ~/.config rather than
        # /Users/<username/Library/whatever
        xdg.enable = true;

        # Let Home Manager install and manage itself.
        programs.home-manager.enable = true;
    };
  };
}
