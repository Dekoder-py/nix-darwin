{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    sessionVariables = {
      TERM = "xterm-256color";
      PATH = "$HOME/go/bin:$HOME/.local/bin:$PATH";
      FZF_DEFAULT_OPTS = " \
        --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
        --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
        --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
        --color=selected-bg:#45475A \
        --color=border:#6C7086,label:#CDD6F4";
    };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
      }
      {
        name = "zsh-fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];

    oh-my-zsh = {
      enable = true;
      theme = "edvardm";
      plugins = [
        "git"
        "sudo"
      ];
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ...";
      l = "eza -lh --icons=always";
      ls = "eza -1 --icons=always";
      ll = "eza -lha --icons=always --sort=name --group-directories-first";
      ld = "eza -lhD --icons=always";
      lt = "eza --icons=always --tree";
      src = "source ~/.zshrc";
    };

    initContent = ''
      bindkey -e
      bindkey -v
      bindkey -s ^f "tmux-sessionizer\n"
      eval "$(zoxide init zsh --cmd z)"

      export FZF_DEFAULT_COMMAND='fd --hidden --exclude Library --exclude Applications --exclude ".cache"' # fzf will use fd, inculding hidden and excluding large folders
      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

      # The following lines have been added by Docker Desktop to enable Docker CLI completions.
      fpath=(/Users/kyle/.docker/completions $fpath)
      autoload -Uz compinit
      compinit
      # End of Docker CLI completions
    '';
  };
}
