{
  programs.nixvim = {
    enable = true;

    opts = {
      tabstop = 2;      
      shiftwidth = 2;   
      expandtab = true; 
      number = true;
      relativenumber = true;
      signcolumn = "yes";
    };

    colorschemes.catppuccin.enable = true;

    plugins = {
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };
      indent-blankline.enable = true;
      gitsigns.enable = true;
      lazygit.enable = true;
      telescope.enable = true;
    };
  };
}
