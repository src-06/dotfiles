{self, ...}: {
  flake.nixosModules.laptop = {
    pkgs,
    system,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      self.nixosModules.btrfs-ephemeral
      self.nixosModules.amd-cpu
    ];

    nixpkgs.hostPlatform = system;

    programs.btrfs-ephemeral = {
      enable = true;
      disk = "/dev/disk/by-id/ata-KINGSTON_RBUSNS8280S3128GH2_50026B736B039CEC";
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_zen;

      kernelParams = [
        #"quiet"
        #"splash"
        #"loglevel=3"
        "ivrs_ioapic[5]=00:14.0"
        #"amdgpu.ppfeaturemask=0xffffffff"
      ];

      kernel.sysctl = {
        "vm.swappiness" = 10;
        "vm.vfs_cache_pressure" = 50;
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 5;
      };

      supportedFilesystems = ["ntfs"];

      loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 5;
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
