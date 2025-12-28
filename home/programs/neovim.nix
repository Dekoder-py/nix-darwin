{
  programs.nixvim = {
    enable = true;

    opts = {
      tabstop = 2;      
      shiftwidth = 2;   
      expandtab = true; 
    };

    colorschemes.catppuccin.enable = true;

    statusline.lualine.enable = true;

    plugins = {
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };
      indent-blankline = {
        enable = true;
      };
    };
  };
}
