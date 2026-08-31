{
  flake.nixosModules.desktop = {pkgs, ...}: {
    services.displayManager.noctalia-greeter = {
      enable = true;

      cursorTheme = {
        name = "Imouto";
        package = pkgs.imouto-cursor-theme;
      };

      settings.cursor.size = 32;
    };

    persistence.dirs = [
      "/var/lib/AccountsService"
      "/var/lib/noctalia-greeter"
    ];
  };
}
