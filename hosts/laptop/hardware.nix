{self, ...}: {
  flake.nixosModules.laptop = {system, ...}: {
    imports = with self.nixosModules; [
      amd-cpu
      btrfs-ephemeral
    ];

    nixpkgs.hostPlatform = system;

    programs.btrfs-ephemeral = {
      enable = true;
      disk = "/dev/disk/by-id/ata-KINGSTON_RBUSNS8280S3128GH2_50026B736B039CEC";
    };

    boot = {
      kernelParams = [
        #"quiet"
        #"splash"
        #"loglevel=3"
        "ivrs_ioapic[5]=00:14.0"
      ];

      kernel.sysctl = {
        "vm.swappiness" = 10;
        "vm.vfs_cache_pressure" = 50;
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 5;
      };

      loader = {
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
        };

        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };
    };

    zramSwap = {
      enable = true;
      algorithm = "zstd";
      memoryPercent = 50;
      priority = 100;
    };

    fileSystems."/mnt/Data" = {
      device = "/dev/disk/by-uuid/ddd2756c-f240-457a-af29-6cc6a8d0f364";
      fsType = "ext4";
      noCheck = true;
      options = ["nofail"];
    };
  };
}
