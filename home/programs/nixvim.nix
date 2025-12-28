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
      lsp = {
    enable = true;

    servers = {
      nixd.enable = true;          
      lua_ls.enable = true;        
      pyright.enable = true;       
      ts_ls.enable = true;         
      astgrep.enable = true;         
    };
      indent-blankline.enable = true;
      gitsigns.enable = true;
      lazygit.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      oil.enable = true;
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
    {
      mode = "n";
      key = "<leader>lg";
      action = "<cmd>LazyGit<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Open LazyGit";
      };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Oil<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Open Oil";
      };
    }
  ];
  };
}
