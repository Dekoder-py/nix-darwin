{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    terminal = "xterm-256color";
    baseIndex = 1;
    keyMode = "vi";
    plugins = [
      tmuxPlugins.tmux-fzf
      {
        plugin = tmuxPlugins.tmux-fzf;
      }

      tmuxPlugins.yank
      {
        plugin = tmuxPlugins.yank;
      }
    ];

    extraConfig = ''
      set -g status-interval 5
      set -g status-left-length 99
      set -g status-right-length 99
      set -g status-justify absolute-centre
    '';
  };
}
