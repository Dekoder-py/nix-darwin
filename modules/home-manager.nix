{ username
, home-manager
, nixvim
, ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit username nixvim;
    };
    users.${username} = import ../home;
  };
}
