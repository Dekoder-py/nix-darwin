{
  username,
  nix-homebrew,
  ...
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
      "raspberry-pi-imager"
      "obs"
      "altserver"
      "sf-symbols"
      "prismlauncher"
      "1password"
      "1password-cli"
      "firefox"
      "ghostty"
      "home-assistant"
      "setapp"
      "alfred"
      "steam"
      "obsidian"
      "slack"
      "signal"
    ];
  };
}
