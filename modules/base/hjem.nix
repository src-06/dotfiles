{inputs, ...}: {
  flake.nixosModules.base = {
    config,
    lib,
    ...
  }: let
    inherit (lib) mkOption mkIf mkDefault;
    inherit (lib.types) bool attrs;
    inherit (config.preferences.user) name home;

    cfg = config.hjem;
  in {
    options.hjem = {
      enable = mkOption {
        type = bool;
        default = true;
        description = "Enable Hjem user file management wrapper";
      };

      file = mkOption {
        type = attrs;
        default = {};
        description = "Files under directory $HOME (~)";
      };

      cache.files = mkOption {
        type = attrs;
        default = {};
        description = "Files under directory ~/.cache";
      };

      config.files = mkOption {
        type = attrs;
        default = {};
        description = "Files under directory ~/.config";
      };

      data.files = mkOption {
        type = attrs;
        default = {};
        description = "Files under directory ~/.local/share";
      };

      state.files = mkOption {
        type = attrs;
        default = {};
        description = "Files under directory ~/.local/state";
      };
    };

    imports = [
      inputs.hjem.nixosModules.default
    ];

    config = mkIf cfg.enable {
      hjem = {
        clobberByDefault = mkDefault true;

        users.${name} = {
          enable = mkDefault true;
          user = name;
          directory = home;

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
