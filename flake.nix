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
    hostname = "machine";
    configuration = {pkgs, ...}: {
      networking.hostName = hostname;
      system.primaryUser = "kyle";

      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };
        greedyCasks = true; # upgrade casks marked as greedy
        casks = [
          "docker-desktop"
          "discord"
          "wakatime"
          "raspberry-pi-imager"
          "obs"
          "altserver"
          "sf-symbols"
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
        nodePackages.vercel
        mas
        wget
        docker
        uv
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

      system.defaults = {
        # Mac Settings
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.ApplePressAndHoldEnabled = false;

        # Finder Settings
        finder.ShowPathbar = true;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "Nlsv"; # List view
        finder.ShowStatusBar = true;
        finder.CreateDesktop = false; # Disable desktop items

        # Dock Settings
        dock.autohide = true; # auto hide dock
        dock.autohide-delay = 0.0; # no delay for showing dock
        dock.show-recents = false; # Don't show recent apps
        dock.minimize-to-application = true; # Minimize apps into their icon
        dock.showhidden = true; # Make hidden apps' icons translucent
        dock.persistent-apps = [ # set dock apps
          {
            app = "/Applications/Firefox.app/";
          }
          {
            app = "/Applications/Ghostty.app/";
          }
          {
            app = "/Applications/Xcode.app/";
          }
          {
            app = "/Applications/Obsidian.app/";
          }
          {
            app = "/Applications/Slack.app/";
          }
          {
            app = "/System/Applications/Mail.app/";
          }
          {
            app = "/Applications/Cider.app/";
          }
        ];

        # Trackpad
        trackpad.Clicking = true;
      };

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
    # $ darwin-rebuild build --flake .#<whatever hostname is set in the var at the top of outputs>
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
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
