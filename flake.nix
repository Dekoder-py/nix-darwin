{
  description = "My nix-darwin flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, ... }: {
      system.primaryUser = "kyleb";

      # Packages
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = import ./packages.nix { inherit pkgs; };

      homebrew.enable = true;
      homebrew.casks = [
        "obsidian"
        "kitty"
        "zen"
      ];

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
      modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                # Install Homebrew under the default prefix
                enable = true;

                # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                enableRosetta = true;

                # User owning the Homebrew prefix
                user = "kyleb";

                # Automatically migrate existing Homebrew installations
                autoMigrate = true;
              };
            }
        ];
    };
  };
}
