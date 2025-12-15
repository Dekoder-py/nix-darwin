{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

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
      lg = "lazygit";
      l = "eza -lh --icons=always";
      ls = "eza -1 --icons=always";
      ll = "eza -lha --icons=always --sort=name --group-directories-first";
      ld = "eza -lhD --icons=always";
      lt = "eza --icons=always --tree";
    };

    initExtra = ''
      set -o vi

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "${s.:. LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

      [ "$TERM" = "xterm-kitty" ] && alias ssh='kitty +kitten ssh' # fix ssh in kitty
      if [[ "$TERM" == "xterm-ghostty" ]]; then
      alias ssh='TERM=xterm-256color ssh'
      fi

      eval "$(zoxide init zsh --cmd cd)"

      export FZF_DEFAULT_COMMAND='fd --hidden --exclude Library --exclude Applications --exclude ".cache"' # fzf will use fd, inculding hidden and excluding large folders
      # The following lines have been added by Docker Desktop to enable Docker CLI completions.
      fpath=(/Users/kyle/.docker/completions $fpath)
      autoload -Uz compinit
      compinit
      # End of Docker CLI completions
    '';
  };
}
