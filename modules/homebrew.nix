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
      "tidal"
      "tailscale-app"
      "iina"
      "discord"
      "prismlauncher"
      "helium-browser"
      "godot"
      "tiled"
      "todoist-app"
      "krita"
      "bitwarden"
      "ghostty"
      "intellij-idea"
      "clion"
      "home-assistant"
      "alfred"
      "steam"
      "obsidian"
      "slack"
      "signal"
      "thunderbird"
    ];
    brews = [
      "raylib"
    ];
  };
}
