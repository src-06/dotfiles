{
  flake.nixosModules.amd-cpu = {config, ...}: {
    boot = {
      kernelModules = [
        "kvm-amd"
        "k10temp"
        "v4l2loopback"
      ];

      extraModulePackages = with config.boot.kernelPackages; [
        v4l2loopback
      ];

      initrd = {
        availableKernelModules = [
          "xhci_pci"
          "ahci"
          "usb_storage"
          "usbhid"
          "sd_mod"
          "rtsx_pci_sdmmc"
        ];

        kernelModules = ["amdgpu"];
      };
    };

    services.xserver.videoDrivers = ["amdgpu"];

    hardware = {
      cpu.amd.updateMicrocode = true;
      enableRedistributableFirmware = true;
      enableAllFirmware = true;

      amdgpu = {
        initrd.enable = true;
        opencl.enable = true;
      };

      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
