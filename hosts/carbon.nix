{...}: let
  hostname = "carbon";
in {
  networking.hostName = hostname;
  system.primaryUser = "kyle";
  users.users.kyle.home = /Users/kyle;
}
