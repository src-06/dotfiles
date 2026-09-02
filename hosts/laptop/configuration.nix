{self, ...}: {
  flake.nixosModules.laptop = {
    imports = [
      self.nixosModules.general

      self.nixosModules.desktop
      self.nixosModules.apps
      self.nixosModules.devs

      self.nixosModules.services
    ];

    preferences.user.fullname = "Kasane Teto";

    programs.resolved.enable = true;

    persistence.data.dirs = [
      "Downloads"
      "Games"
      "Libraries"
      "Prefixes"
      "Projects"
    ];
  };
}
