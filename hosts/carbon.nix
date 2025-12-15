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
}
