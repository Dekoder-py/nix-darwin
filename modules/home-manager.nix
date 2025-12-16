{ username
, home-manager
, ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit username;
    };
    users.${username} = import ../home;
  };
}
