{username, ...}: let
in {
  system.primaryUser = username;
  users.users.kyleb.home = /Users/kyleb;

  imports = [
    ../modules/base.nix
    ../modules/homebrew.nix
    ../modules/system.nix
    ../modules/packages.nix
  ];

  homebrew.casks = [
    "google-chrome"
  ];

  system.defaults.dock.persistent-apps = [
    # set dock apps
    {
      app = "/Applications/Firefox.app/";
    }
    {
      app = "/Applications/Google Chrome.app/";
    }
    {
      app = "/Applications/Ghostty.app/";
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
  ];
}
