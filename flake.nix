{
  description = "My nix-darwin flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # Packages
      environment.systemPackages = import ./packages.nix { inherit pkgs; };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";


      # Enable touch id and apple watch verification for sudo
      security.pam.services.sudo_local.touchIdAuth = true;
      security.pam.services.sudo_local.watchIdAuth = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#darwin
    darwinConfigurations."darwin" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
