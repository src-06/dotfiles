{self, ...}: {
  flake.nixosModules.laptop = {
    imports = with self.nixosModules; [
      general

      desktop
      apps
      devs

      services
    ];

    persistence.data.dirs = [
      "Downloads"
      "Games"
      "Libraries"
      "Prefixes"
      "Projects"
    ];
  };
}
