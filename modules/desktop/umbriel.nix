{
  flake.nixosModules.desktop = {pkgs, ...}: {
    programs.umbriel.enable = true;

    hjem.config.files."xdg-desktop-portal-umbriel/config.toml".text = ''
      [screencast]
      chooser_cmd = "${pkgs.xdg-desktop-portal-umbriel}/libexec/umbriel-share-picker"
    '';

    persistence.data.dirs = [
      ".config/umbriel"
    ];
  };
}
