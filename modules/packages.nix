{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodePackages.vercel
    mas
    wget
    uv
    serve
    pnpm
    tree-sitter
    btop
    yazi
    python3
    lazygit
    nodejs
    tmux
    stow
    zoxide
    eza
    ripgrep
    fd
    bat
    fzf
    gnupg
    gh
    cargo
  ];
}
