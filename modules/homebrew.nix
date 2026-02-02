{
  username,
  nix-homebrew,
  ...
}:
{
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
      "font-atkinson-hyperlegible"
      "font-jetbrains-mono-nerd-font"
      "dolphin"
      "notion"
      "tidal"
      "tailscale-app"
      "iina"
      "zen"
      "discord"
      "prismlauncher"
      "1password"
      "1password-cli"
      "ghostty"
      "home-assistant"
      "alfred"
      "steam"
      "obsidian"
      "slack"
      "signal"
      "thunderbird"
      "zed"
    ];
  };
}
