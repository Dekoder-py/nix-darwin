{ pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  imports = [
    ./programs/git.nix
    ./programs/zsh.nix
    ./programs/neovim.nix
    ./programs/ghostty.nix
  ];
}

