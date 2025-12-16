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
    ];

    extraConfig = ''
      set -g status-interval 5
      set -g status-left-length 99
      set -g status-right-length 99
      set -g status-justify absolute-centre
    '';
  };
}
