{ pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  imports = [
    ./programs/git.nix
    ./programs/gh.nix
    ./programs/zsh.nix
    ./programs/neovim.nix
    ./programs/ghostty.nix
    ./programs/bat.nix
    ./programs/btop.nix
    ./programs/lazygit.nix
  ];
}

