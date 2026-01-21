{ username, pkgs, ... }:
let
in {
  system.primaryUser = username;
  users.users.kyleb.home = "/Users/${username}";

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
    "google-chrome"
    "godot"
  ];

  system.defaults.dock.persistent-apps = [
    # set dock apps
    {
      app = "/Applications/Zen.app/";
    }
    {
      app = "/Applications/Google Chrome.app/";
    }
    {
      app = "/Applications/Ghostty.app/";
    }
    {
      app = "/Applications/Notion.app/";
    }
    {
      app = "/Applications/Slack.app/";
    }
    {
      app = "/System/Applications/Mail.app/";
    }
  ];
}
