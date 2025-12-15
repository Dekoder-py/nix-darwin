{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
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
      lg = "lazygit";
      l = "eza -lh --icons=always";
      ls = "eza -1 --icons=always";
      ll = "eza -lha --icons=always --sort=name --group-directories-first";
      ld = "eza -lhD --icons=always";
      lt = "eza --icons=always --tree";
      update-flake = "cd /etc/nix-darwin && nix flake update && git add flake.lock && git commit && git push";
      rebuild = "sudo darwin-rebuild switch";
    };

    initContent = ''
      set -o vi

      if [[ "$TERM" == "xterm-ghostty" ]]; then
      alias ssh='TERM=xterm-256color ssh'
      fi

      eval "$(zoxide init zsh --cmd z)"

      export FZF_DEFAULT_COMMAND='fd --hidden --exclude Library --exclude Applications --exclude ".cache"' # fzf will use fd, inculding hidden and excluding large folders

      # The following lines have been added by Docker Desktop to enable Docker CLI completions.
      fpath=(/Users/kyle/.docker/completions $fpath)
      autoload -Uz compinit
      compinit
      # End of Docker CLI completions
    '';
  };
}
