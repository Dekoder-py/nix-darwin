{
  description = "Kyle's Macbook Pro System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/2175e5c537f60f156c45c67bee082c1cb33d833d";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
    # nixvim,
    }:
    let
      mkDarwinHost =
        {
          hostname,
          username,
          modules,
        }:
        nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit self username;
          };
          modules = modules ++ [
            { networking.hostName = hostname; }
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };

      configuration = { pkgs, ... }: { };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#carbon
      darwinConfigurations = {
        carbon = mkDarwinHost {
          # macbook pro
          hostname = "carbon";
          username = "kyle";
          modules = [ ./hosts/carbon.nix ];
        };
        darwin = mkDarwinHost {
          # macbook air
          hostname = "darwin";
          username = "kyleb";
          modules = [ ./hosts/darwin.nix ];
        };
      };
    };
}
