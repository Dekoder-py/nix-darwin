{...}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    greedyCasks = true; # upgrade casks marked as greedy
    casks = [
      "docker-desktop"
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
