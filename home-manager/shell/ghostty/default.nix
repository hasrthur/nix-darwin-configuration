{ ... }:

{
    # broken on macos :(
    # programs.ghostty = {
    #   enable = true;
    #   enableZshIntegration = true;
    # };

    xdg.configFile."ghostty/config" = {
      source = ./config;
    };
}