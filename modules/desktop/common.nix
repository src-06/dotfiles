{
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment = {
      systemPackages = with pkgs; [
        (papirus-icon-theme.override {color = "yaru";})
        imouto-cursor-theme
        adw-gtk3

        qt6Packages.qt6ct
        nwg-look

        imagemagick
        ffmpeg-full

        ffmpegthumbnailer # Video thumbnailer
        icoextract # Window executable files thumbnailer
        pcmanfm-qt
        evince # Document thumbnailer and viewer
        (symlinkJoin {
          name = "evince";
          paths = [evince];
          nativeBuildInputs = [makeWrapper];
          postBuild = ''
            wrapProgram $out/bin/evince \
              --prefix GDK_PIXBUF_MODULE_FILE : "${webp-pixbuf-loader}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
          '';
        })

        kitty
        xarchiver
        gparted
      ];

      sessionVariables = {
        TERMINAL = "kitty";
      };
    };

    services = {
      libinput.enable = true;
      gvfs.enable = true;
    };

    xdg = {
      icons.fallbackCursorThemes = ["Imouto"];
      mime.addedAssociations = {
        "application/pdf" = "org.gnome.Evince.desktop";
        "application/x-cbz" = "mpv.desktop";
        "application/zip" = "xarchiver.desktop";
        "image/avif" = "imv-dir.desktop";
        "image/bmp" = "imv-dir.desktop";
        "image/gif" = "imv-dir.desktop";
        "image/heif" = "imv-dir.desktop";
        "image/jpeg" = "imv-dir.desktop";
        "image/jpg" = "imv-dir.desktop";
        "image/png" = "imv-dir.desktop";
        "image/svg+xml" = "imv-dir.desktop";
        "image/x-bmp" = "imv-dir.desktop";
        "image/x-ico" = "imv-dir.desktop";
        "image/x-png" = "imv-dir.desktop";
        "image/webp" = "mpv.desktop";
        "inode/directory" = "pcmanfm-qt.desktop";
      };
    };

    hjem = {
      config.files = {
        "kitty/kitty.conf".text = ''
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

        "user-dirs.dirs".text = ''
          XDG_DOWNLOAD_DIR="$HOME/Downloads"
          XDG_DOCUMENTS_DIR="$HOME/Libraries/Documents"
          XDG_MUSIC_DIR="$HOME/Libraries/Music"
          XDG_PICTURES_DIR="$HOME/Libraries/Photos"
          XDG_VIDEOS_DIR="$HOME/Libraries/Videos"
        '';
      };
    };

    persistence.cache = {
      dirs = [
        ".config/dconf"
        ".config/gtk-3.0"
        ".config/gtk-4.0"
        ".config/xsettingsd"

        ".config/qt5ct"
        ".config/qt6ct"

        ".config/pcmanfm-qt"
      ];

      files = [
        ".gtkrc-2.0"
      ];
    };
  };
}
