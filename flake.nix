{
  description = "Kyle's Macbook Pro System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    nix-homebrew,
  }: let
    mkDarwinHost = {
      hostname,
      username,
      modules,
    }:
      nix-darwin.lib.darwinSystem {
        modules =
          modules
          ++ [
            {networking.hostName = hostname;}
            { _module.args.username = username; }
            nix-homebrew.darwinModules.nix-homebrew
          ];
      };

    configuration = {pkgs, ...}: {
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#carbon
    darwinConfigurations = {
      carbon = mkDarwinHost {
        modules = [
          hostname = "carbon";
          username = "kyle";
          ./hosts/carbon.nix
        ];
      };
    };
  };
}
