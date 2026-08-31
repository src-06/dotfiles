{
  flake.nixosModules.base = {
    config,
    lib,
    ...
  }: let
    cfg = config.preferences;
  in {
    options.preferences = {
      user = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "src-06";
        };
        fullname = lib.mkOption {
          type = lib.types.str;
          default = "Violet Evergarden";
        };
        home = lib.mkOption {
          type = lib.types.str;
          default = "/home/${cfg.user.name}";
        };
      };

      hostname = lib.mkOption {
        type = lib.types.str;
        default = "NixOS";
      };
    };

    config = {
      users.users.${cfg.user.name} = {
        isNormalUser = true;
        home = cfg.user.home;
        description = cfg.user.fullname;
      };

      networking.hostName = cfg.hostname;
    };
  };
}
