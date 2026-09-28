{inputs, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [inputs.umbriel.nixosModules.default];

    programs.umbriel = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-umbriel;
    };

    hjem.config.files."xdg-desktop-portal-umbriel/config.toml".text = ''
      [screencast]
      chooser_cmd = "${pkgs.xdg-desktop-portal-umbriel}/libexec/umbriel-share-picker"
    '';

    persistence.data.dirs = [
      ".config/umbriel"
    ];
  };
}
