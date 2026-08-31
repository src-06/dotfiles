{
  flake.nixosModules.general = {pkgs, ...}: {
    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;

      fontconfig = {
        enable = true;
        useEmbeddedBitmaps = true;

        defaultFonts = {
          sansSerif = ["DejaVu Sans"];
          serif = ["DejaVu Serif"];
          monospace = ["CaskaydiaMono Nerd Font Mono"];
        };
      };

      packages = with pkgs; [
        dejavu_fonts
        # corefonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        nerd-fonts.caskaydia-mono
      ];
    };

    persistence.cache.dirs = [
      ".local/share/fonts"
    ];
  };
}
