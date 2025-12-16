{
  programs.gh = {
    enable = true;
    hosts = {
      "github.com" = {
        user = "Dekoder-py";
      };
    };

    settings = {
      git_protocol = "ssh";

      prompt = "enabled";
    };
  };
}
