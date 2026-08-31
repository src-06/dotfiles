{inputs, ...}: {
  flake.nixosModules.base = {
    config,
    lib,
    ...
  }: let
    cfg = config.hjem;
    user = config.preferences.user;
  in {
    options.hjem = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Hjem user file management wrapper";
      };

      file = lib.mkOption {
        type = lib.types.attrs;
        default = {};
        description = "Files under directory $HOME (~)";
      };

      cache.files = lib.mkOption {
        type = lib.types.attrs;
        default = {};
        description = "Files under directory ~/.cache";
      };

      config.files = lib.mkOption {
        type = lib.types.attrs;
        default = {};
        description = "Files under directory ~/.config";
      };

      data.files = lib.mkOption {
        type = lib.types.attrs;
        default = {};
        description = "Files under directory ~/.local/share";
      };

      state.files = lib.mkOption {
        type = lib.types.attrs;
        default = {};
        description = "Files under directory ~/.local/state";
      };
    };

    imports = [
      inputs.hjem.nixosModules.default
    ];

    config = lib.mkIf cfg.enable {
      hjem = {
        clobberByDefault = lib.mkDefault true;

        users.${user.name} = {
          enable = lib.mkDefault true;
          user = user.name;
          directory = user.home;

          files = cfg.file;

          xdg = {
            cache.files = cfg.cache.files;
            config.files = cfg.config.files;
            data.files = cfg.data.files;
            state.files = cfg.state.files;
          };
        };
      };
    };
  };
}
