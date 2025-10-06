{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  # home.username = "artur";
  # home.homeDirectory = "/Users/artur";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  imports = [
    ./git.nix
    ./shell
    ./just
  ];

  home.packages = with pkgs; [
    bat
    vim
    tig
    devenv
  ];

  # This is to ensure programs are using ~/.config rather than
  # /Users/<username/Library/whatever
  xdg.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv = { 
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    config = {
      global = {
        warn_timeout = 0;
        disable_stdin = true;
        hide_env_diff = true;
        log_format = "";
      };
    };
  };

  # programs.wezterm = {
  #   enable = true;
  #   extraConfig = ''
  #     local mux = wezterm.mux

  #     wezterm.on('gui-startup', function(cmd)
  #       local tab, pane, window = mux.spawn_window(cmd or {})
  #       window:gui_window():maximize()
  #     end)

  #     -- This will hold the configuration.
  #     local config = wezterm.config_builder()

  #     config.use_fancy_tab_bar = false
  #     config.color_scheme = 'Snazzy'
  #     config.font = wezterm.font 'FiraCode Nerd Font Mono'
  #     config.font_size = 14
  #     config.window_background_opacity = 0.8
  #     config.macos_window_background_blur = 20
  #     config.window_decorations = "RESIZE"
  #     config.window_padding = {
  #       left = '1cell',
  #       right = '1cell',
  #       top = '0.5cell',
  #       bottom = '0.5cell',
  #     }

  #     return config
  #   '';
  # };

  # programs.nnn.enable = true;
  programs.gpg.enable = true;
}
