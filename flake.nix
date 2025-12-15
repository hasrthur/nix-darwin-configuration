{
  description = "hasrthur's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    config = {
      username = "artur";
      fullName = "Artur Borysov";
      email = "arthur.borisow@gmail.com";
      flake = "/Users/artur/.config/nix-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Arturs-Laptop
    darwinConfigurations."Arturs-Laptop" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };
      modules = [
        config
        ./system
        inputs.home-manager.darwinModules.home-manager
        ./home.nix
      ];
    };
  };
}
