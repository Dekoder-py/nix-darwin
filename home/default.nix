{
  pkgs,
  username,
  nixvim,
  ...
}: {
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  # This thing lets me fuzzy search options - source: https://www.tonybtw.com/tutorial/nixos-hyprland/#nix-search-tv (and copilot for fixing bug)
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "ns" (builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh"))
    fzf
    nix-search-tv
  ];

  imports = [
    nixvim.homeModules.nixvim
    ./programs/git.nix
    ./programs/gh.nix
    ./programs/zsh.nix
    ./programs/nixvim.nix
    ./programs/ghostty.nix
    ./programs/bat.nix
    ./programs/btop.nix
    ./programs/lazygit.nix
    ./programs/tmux.nix
    ./programs/fastfetch.nix
    ./programs/java.nix
  ];
}
