{ pkgs, lib, ... }:

{
  fonts.packages = with pkgs.nerd-fonts; [
    victor-mono
  ];
}
