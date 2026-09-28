{
  flake.nixosModules.services = {
    services.flatpak.enable = true;

    persistence = {
      dirs = [
        "/var/lib/flatpak"
      ];

      cache.dirs = [
        ".local/share/flatpak"
      ];
    };
  };
}
