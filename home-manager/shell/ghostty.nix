{ pkgs, ... }:

{
    programs.ghostty = {
      enable = true;
      package = pkgs.ghostty-bin;
      enableZshIntegration = true;
      settings = {
        font-family = "VictorMono Nerd Font Mono";
        font-size = 18;
        maximize = true;
      };
    };
}