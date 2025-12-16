{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nodePackages.vercel
    mas
    wget
    uv
    serve
    pnpm
    tree-sitter
    yazi
    python3
    nodejs
    tmux
    stow
    zoxide
    eza
    ripgrep
    fd
    fzf
    gnupg
    gh
    cargo
  ];
}
