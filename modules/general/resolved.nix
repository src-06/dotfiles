{
  flake.nixosModules.general = {
    config,
    lib,
    ...
  }: let
    cfg = config.programs.resolved;
  in {
    options.programs.resolved = {
      enable = lib.mkEnableOption "Enable systemd-resolved for managing DNS";

      dns = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        example = [
          "1.1.1.1"
          "1.0.0.1"
        ];
        description = "Only IPv4 DNS";
      };
    };

    config = lib.mkIf cfg.enable {
      networking = {
        networkmanager = {
          enable = lib.mkDefault true;
          dns = lib.mkDefault "systemd-resolved";
        };

        nameservers = cfg.dns;
      };

      services.resolved = {
        enable = lib.mkDefault true;

        settings.Resolve = {
          DNSOverTLS = lib.mkDefault true;
          DNSSEC = lib.mkDefault "true";
        };
      };
    };
  };
}
