{inputs, ...}: {
  flake.nixosModules.btrfs-ephemeral = {
    config,
    lib,
    ...
  }: let
    inherit (lib) mkEnableOption mkOption mkIf;
    inherit (lib.types) str;

    cfg = config.programs.btrfs-ephemeral;
  in {
    options.programs.btrfs-ephemeral = {
      enable = mkEnableOption "Enable Btrfs (with root tmpfs) filesystem";

      disk = mkOption {
        type = str;
        example = "/dev/disk/by-id/...";
        description = "Device path. Recomended using '/dev/disk/by-id/...'";
      };
    };

    imports = [
      inputs.disko.nixosModules.disko
    ];

    config = mkIf cfg.enable {
      disko.devices = {
        disk.main = {
          device = cfg.disk;
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                type = "EF00";
                size = "1G";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = ["umask=0077" "dmask=0077"];
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = ["-L" "NixOS" "-f"];
                  subvolumes = {
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = ["compress=zstd:3" "noatime"];
                    };
                    "@persist" = {
                      mountpoint = "/persist";
                      mountOptions = ["compress=zstd:3" "noatime"];
                    };
                  };
                };
              };
            };
          };
        };

        nodev."/" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=25%"
            "mode=755"
          ];
        };
      };

      fileSystems = {
        "/persist".neededForBoot = true;
        "/nix".neededForBoot = true;
      };
    };
  };
}
