{ username
, nix-homebrew
, ...
}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    greedyCasks = true; # upgrade casks marked as greedy
    casks = [
      "discord"
      "wakatime"
      "prismlauncher"
      "1password"
      "1password-cli"
      "ghostty"
      "home-assistant"
      "alfred"
      "raycast"
      "steam"
      "obsidian"
      "slack"
      "signal"
    ];
    masApps = {
      "Ghosttery" = 6504861501;
    };
  };
}
