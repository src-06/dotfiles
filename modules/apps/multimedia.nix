{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # Media player
      (mpv.override {
        scripts = with pkgs.mpvScripts; [
          modernz
          manga-reader
          mpv-gallery-view
          mpv-image-viewer.minimap
          mpv-image-viewer.image-positioning
        ];
      })

      # Music player
      (audacious.override {withPlugins = true;})
      pear-desktop

      # Image viewer
      imv

      # Vector editor
      #drawio
      #inkscape

      # Image editor
      #gimp
      #pinta

      # Video editor
      #shotcut
      #kdePackages.kdenlive

      # Audio editor
      #audacity
    ];

    persistence.cache.dirs = [
      ".config/YouTube Music"
    ];
  };
}
