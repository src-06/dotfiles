{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # Media player
      (mpv.override {
        scripts = with pkgs.mpvScripts; [
          modernz
          manga-reader
          mpv-gallery-view
        ];
      })

      # Music player
      rufin
      pear-desktop

      # Image viewer
      imv

      # Vector editor
      #drawio
      #inkscape

      # Image editor
      #gimp
      pinta

      # Video editor
      #shotcut
      #kdePackages.kdenlive

      # Audio editor
      #audacity
    ];

    persistence.cache.dirs = [
      ".config/rufin"
      ".config/YouTube Music"
    ];
  };
}
