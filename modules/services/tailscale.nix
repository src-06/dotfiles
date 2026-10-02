{
  flake.nixosModules.services = {
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };

    persistence.dirs = [
      "/var/lib/tailscale"
    ];
  };
}
