{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;

    statusline.lualine.enable = true;

    plugins = {
    treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
    };
  };

  };
}
