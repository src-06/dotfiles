{
  flake.nixosModules.services = {
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };
  };
}
