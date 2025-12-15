{ config, ... }:

{
  nix = {
    checkConfig = true;
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ config.username ];
      extra-platforms = "x86_64-darwin aarch64-darwin";
    };
  };
}
