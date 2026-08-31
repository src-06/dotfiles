{
  flake.nixosModules.base = {
    pkgs,
    config,
    ...
  }: let
    cfg = config.preferences.user;
  in {
    users.users = {
      ${cfg.name} = {
        extraGroups = [
          "wheel"
          "networkmanager"
        ];

        #initialPassword = "1";
        hashedPasswordFile = "/persist/passwd";

        shell = pkgs.fish;
      };

      root.shell = pkgs.fish;
    };
  };
}
