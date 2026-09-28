{
  flake.nixosModules.general = {
    config,
    lib,
    ...
  }: let
    inherit (lib) mkOption mkDefault mkIf;
    inherit (lib.types) listOf bool str;

    cfg = config.programs.resolved;
  in {
    options.programs.resolved = {
      enable = mkOption {
        type = bool;
        default = true;
        description = "Enable systemd-resolved for managing DNS";
      };

      dns = mkOption {
        type = listOf str;
        default = [];
        example = [
          "1.1.1.1"
          "1.0.0.1"
        ];
        description = "Only IPv4 DNS";
      };
    };

    config = mkIf cfg.enable {
      networking = {
        networkmanager = {
          enable = mkDefault true;
          dns = mkDefault "systemd-resolved";
        };

        nameservers = cfg.dns;
      };

      services.resolved = {
        enable = mkDefault true;

        settings.Resolve = {
          DNSOverTLS = mkDefault true;
          DNSSEC = mkDefault "true";
        };
      };
    };
  };
}
