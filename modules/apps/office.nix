{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      onlyoffice-desktopeditors
    ];

    persistence.cache.dirs = [
      ".config/onlyoffice"
      ".local/share/onlyoffice/desktopeditors/recover"
    ];
  };
}
