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
}
