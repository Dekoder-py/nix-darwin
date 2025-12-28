{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";
    globals.maplocalleader = " ";

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

    keymaps = [
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>Telescope find_files<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Find files (Telescope)";
      };
    }
  ];
  };
}
