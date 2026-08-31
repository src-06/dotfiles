{inputs, ...}: {
  flake.nixosModules.base = {
    config,
    lib,
    ...
  }: let
    cfg = config.persistence;
    user = config.preferences.user.name;
    persistUserData =
      if builtins.hasAttr "/mnt/Data" config.fileSystems
      then "/mnt/Data"
      else "/persist/userdata";
  in {
    options.persistence = {
      dirs = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Persistance system data directories";
      };

      files = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Persistance system data files";
      };

      cache = {
        dirs = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Persistance user cache directories";
        };

        files = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Persistance user cache files";
        };
      };

      data = {
        dirs = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Persistance user data directories";
        };

        files = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [];
          description = "Persistance user data files";
        };
      };
    };

    imports = [
      inputs.preservation.nixosModules.default
    ];

    config = lib.mkIf config.programs.btrfs-ephemeral.enable {
      preservation = {
        enable = true;

        preserveAt = {
          "/persist/system" = {
            directories =
              [
                "/var/lib/nixos"

                "/var/lib/systemd/backlight"
                "/var/lib/systemd/coredump"
                "/var/lib/systemd/rfkill"
                "/var/lib/systemd/timers"

                "/var/log"
              ]
              ++ cfg.dirs;

            files =
              [
                {
                  file = "/etc/machine-id";
                  inInitrd = true;
                }
                {
                  file = "/var/lib/systemd/random-seed";
                  how = "symlink";
                  inInitrd = true;
                }
              ]
              ++ cfg.files;
          };

          "/persist/usercache" = {
            inUser = user;
            directories = cfg.cache.dirs;
            files = cfg.cache.files;
          };

          ${persistUserData} = {
            inUser = user;
            commonMountOptions = ["x-gvfs-hide"];
            directories = cfg.data.dirs;
            files = cfg.data.files;
          };
        };
      };

      systemd = {
        suppressedSystemUnits = ["systemd-machine-id-commit.services"];
        services.systemd-machine-id-commit = {
          unitConfig.ConditionPathIsMountPoint = ["" "/persist/system/etc/machine-id"];
          serviceConfig.ExecStart = ["" "systemd-machine-id-setup --commit --root /persist/system"];
        };
        coredump.settings.Coredump = {
          MaxUse = "500M";
        };
      };
    };
  };
}
