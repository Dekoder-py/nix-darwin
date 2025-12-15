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
    };
  };
}
