darwin-rebuild *ARGS:
    -@sudo darwin-rebuild switch --flake /etc/nix-darwin --show-trace --verbose {{ARGS}}

nix-update *ARGS:
    -@nix flake update --flake /etc/nix-darwin