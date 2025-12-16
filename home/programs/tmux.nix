{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    terminal = "xterm-256color";
    baseIndex = 1;
    keyMode = "vi";
    newSession = true;

    plugins = with pkgs.tmuxPlugins; [
      tmux-fzf
      yank
      resurrect
      minimal-tmux-status
    ];

    extraConfig = ''
      set -g status-position top
      set -g renumber-window on
      set -g status-style bg=default
      set -g status-interval 5
      set -g status-left-length 99
      set -g status-right-length 99
      set -g status-justify absolute-centre

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };
}
