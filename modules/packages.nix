{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nodePackages.vercel
    mas
    yt-dlp
    wget
    uv
    serve
    pnpm
    tree-sitter
    yazi
    python3
    nodejs
    stow
    zoxide
    eza
    ripgrep
    fd
    fzf
    gnupg
    cargo
  ];
}
