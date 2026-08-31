{self, ...}: {
  flake.nixosModules.laptop = {
    imports = [
      self.nixosModules.general

      self.nixosModules.desktop
      self.nixosModules.apps
    ];

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
