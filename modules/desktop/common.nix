{
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      (papirus-icon-theme.override {color = "yaru";})
      imouto-cursor-theme
      adw-gtk3

      kdePackages.qt6ct
      nwg-look

      kitty
      xarchiver
      gparted

      imagemagick
      ffmpeg-full
    ];

    programs = {
      xfconf.enable = true;
      thunar = {
        enable = true;
        plugins = with pkgs; [
          (thunar-archive-plugin.overrideAttrs (old: {
            postInstall =
              (old.postInstall or "")
              + ''
                install -Dm755 ${pkgs.xarchiver}/libexec/thunar-archive-plugin/xarchiver.tap $out/libexec/thunar-archive-plugin/xarchiver.tap
              '';
          }))
        ];
      };
    };

    services = {
      libinput.enable = true;
      gvfs.enable = true;
      tumbler.enable = true;
    };

    hjem.config.files."kitty/kitty.conf".text = ''
      font_family CaskaydiaMono Nerd Font Mono
      font_size 11.0

      cursor_shape beam
      cursor_trail 3

      background_opacity 0.8

      window_margin_width 6.0
      remember_window_size false
      initial_window_width 960
      initial_window_height 480

      scrollback_lines 10000
      confirm_os_window_close 0
      enable_audio_bell no
    '';

    persistence.cache = {
      dirs = [
        ".config/dconf"
        ".config/gtk-3.0"
        ".config/gtk-4.0"
        ".config/xsettingsd"

        ".config/qt5ct"
        ".config/qt6ct"

        ".config/Thunar"
        ".config/xfce4/xfconf"
      ];

      files = [
        ".gtkrc-2.0"
      ];
    };
  };
}
