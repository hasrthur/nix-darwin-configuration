{ osConfig, ... }:

{
  programs.nh = {
    enable = true;
    flake = osConfig.flake;
  };
}
