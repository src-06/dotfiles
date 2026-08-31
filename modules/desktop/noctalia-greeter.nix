{inputs, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    #services.displayManager.noctalia-greeter = {
    #  enable = true;

    #  cursorTheme = {
    #    name = "Imouto";
    #    package = pkgs.imouto-cursor-theme;
    #  };

    #  settings.cursor.size = 32;
    #};
    imports = [inputs.noctalia-greeter.nixosModules.default];

    programs.noctalia-greeter = {
      enable = true;
      settings = {
        cursor = {
          theme = "Imouto";
          size = 32;
          path = "${pkgs.imouto-cursor-theme}/share/icons";
        };
        keyboard = {
          layout = "us";
        };
      };
    };

    persistence.dirs = [
      "/var/lib/AccountsService"
      "/var/lib/noctalia-greeter"
    ];
  };
}
