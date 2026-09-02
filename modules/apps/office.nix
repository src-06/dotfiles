{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      onlyoffice-desktopeditors
    ];

    xdg.mime.removedAssociations."text/markdown" = "onlyoffice-desktopeditors.desktop";

    persistence.cache.dirs = [
      ".config/onlyoffice"
      ".local/share/onlyoffice/desktopeditors/recover"
    ];
  };
}
