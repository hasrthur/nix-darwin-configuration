{ config, ... }:

{
  home.shell.enableZshIntegration = false;
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    dotDir = config.home.homeDirectory + "/.config/zsh";
    initContent = ''
        export EDITOR="vim"
        export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
        export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts":$PATH

        export DIRENV_LOG_FORMAT=

        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi

        alias cat=bat
    '';
    syntaxHighlighting.enable = false;
  };
}