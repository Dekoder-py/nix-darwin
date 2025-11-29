{
  description = "Kyle's Macbook Pro System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    nix-homebrew,
  }: let
    configuration = {pkgs, ...}: {
      system.primaryUser = "kyle";
      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };
        casks = [
          "prismlauncher"
          "1password"
          "1password-cli"
          "firefox"
          "ghostty"
          "home-assistant"
          "setapp"
          "alfred"
          "steam"
          "obsidian"
          "slack"
          "signal"
        ];
      };
      environment.systemPackages = with pkgs; [
        serve
        pnpm
        tree-sitter
        btop
        neovim
        yazi
        python3
        lazygit
        nodejs
        tmux
        stow
        zoxide
        eza
        ripgrep
        fd
        bat
        fzf
        gnupg
        gh
        cargo
      ];

      nixpkgs.config.allowUnfree = true;

      # enable Touch ID and Watch ID for sudo commands
      security.pam.services.sudo_local = {
        touchIdAuth = true;
        watchIdAuth = true;
        reattach = true;
      };

      # Finder Settings
      system.defaults.finder.ShowPathbar = true;
      system.defaults.finder.AppleShowAllExtensions = true;
      system.defaults.finder.FXPreferredViewStyle = "Nlsv"; # List view
      system.defaults.finder.ShowStatusBar = true;
      system.defaults.finder.CreateDesktop = false; # Disable desktop items

      # Dock Settings
      system.defaults.dock.autohide = true;
      system.defaults.dock.autohide-delay = 0.0;
      system.defaults.dock.show-recents = false;

      # Trackpad
      system.defaults.trackpad.Clicking = true;

      # disable the macron menu
      system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#machine
    darwinConfigurations."machine" = nix-darwin.lib.darwinSystem {
      modules = [
        nix-homebrew.darwinModules.nix-homebrew

        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "kyle";

            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
          };
        }

        configuration
      ];
    };
  };
}
