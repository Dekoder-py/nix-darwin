{ username
, pkgs
, ...
}:
let
in {
  system.primaryUser = username;
  users.users.kyle.home = "/Users/${username}";

  imports = [
    ../modules/base.nix
    ../modules/homebrew.nix
    ../modules/system.nix
    ../modules/packages.nix
    ../modules/home-manager.nix
  ];

  environment.systemPackages = with pkgs; [
  ];

  homebrew.casks = [
    "docker-desktop"
    "setapp"
    "raspberry-pi-imager"
    "sf-symbols"
    "obs"
    "altserver"
  ];

  system.defaults.dock.persistent-apps = [
    # set dock apps
    {
      app = "/Applications/Orion.app/";
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
      app = "/Applications/Thunderbird.app";
    }
    {
      app = "/Applications/Cider.app/";
    }
  ];
}
