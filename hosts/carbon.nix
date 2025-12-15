{username, ...}: let
in {
  system.primaryUser = username;
  users.users.kyle.home = /Users/kyle;

  imports = [
    ../modules/base.nix
    ../modules/homebrew.nix
    ../modules/system.nix
    ../modules/packages.nix
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
}
