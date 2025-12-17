{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator = "  ";
      };
      modules = [
        "host"
        "cpu"
        "gpu"
        "packages"
        "uptime"
        "display"
        "disk"
        "memory"
      ];
    };
  };
}
