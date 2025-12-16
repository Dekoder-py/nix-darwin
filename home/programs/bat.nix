{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "6810349b28055dce54076712fc05fc68da4b8ec0";
        };
        file = "Catppuccin Mocha.tmTheme";
      };
    };
    config = {
      theme = "Catppuccin Mocha";
    };
  };
}
