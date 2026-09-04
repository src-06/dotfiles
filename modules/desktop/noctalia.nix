{
  flake.nixosModules.desktop = {
    pkgs,
    config,
    ...
  }: let
    inherit (config.preferences.theme) id colors;
    inherit (colors) base00 base01 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;
    theme = {
      mPrimary = base09;
      mOnPrimary = base00;
      mSecondary = base0B;
      mOnSecondary = base00;
      mTertiary = base0D;
      mOnTertiary = base00;
      mError = base08;
      mOnError = base00;
      mSurface = base00;
      mOnSurface = base07;
      mSurfaceVariant = base01;
      mOnSurfaceVariant = base04;
      mOutline = base03;
      mShadow = base00;
      mHover = base0D;
      mOnHover = base02;
      terminal = let
        color = {
          black = base01;
          red = base08;
          green = base0B;
          yellow = base0A;
          blue = base0D;
          magenta = base0E;
          cyan = base0C;
          white = base05;
        };
      in {
        normal = color;
        bright = color;
        foreground = base06;
        background = base00;
        selectionFg = base00;
        selectionBg = base0D;
        cursorText = base00;
        cursor = base0F;
      };
    };
  in {
    environment.systemPackages = with pkgs; [
      # Needed for noctalia specific plugins
      pulseaudio
      wl-mirror
    ];

    programs.noctalia.enable = true;

    hjem.config.files."noctalia/palettes/${id}.json".source = (pkgs.formats.json {}).generate "${id}.json" {
      dark = theme;
      light = theme;
    };

    persistence.data.dirs = [
      ".local/state/noctalia"
    ];
  };
}
