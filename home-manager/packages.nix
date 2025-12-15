{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    tig
    devenv
    inetutils
  ];
}
