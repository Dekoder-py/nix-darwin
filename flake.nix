{
  description = "Kyle's Macbook Pro System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    nix-homebrew,
    home-manager,
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
            {
              _module.args = {
                inherit username self;
              };
            }
            home-manager.darwinModules.home-manager
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
        # macbook pro
        hostname = "carbon";
        username = "kyle";
        modules = [./hosts/carbon.nix];
      };
      darwin = mkDarwinHost {
        # macbook air
        hostname = "darwin";
        username = "kyleb";
        modules = [./hosts/darwin.nix];
      };
    };
  };
}
