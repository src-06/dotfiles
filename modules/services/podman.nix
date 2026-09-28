{
  flake.nixosModules.services = {pkgs, ...}: {
    environment.systemPackages = [pkgs.podman-compose];

    virtualisation.podman.enable = true;

    users.extraGroups.podman.members = ["src-06"];

    persistence.cache.dirs = [
      ".local/share/containers" # Rootless podman
    ];
  };
}
