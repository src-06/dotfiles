{
  flake.nixosModules.base = {
    config,
    lib,
    ...
  }: let
    cfg = config.preferences;

    mkColor = default:
      lib.mkOption {
        type = lib.types.addCheck lib.types.str (x: !isNull (builtins.match "#?[0-9a-fA-F]{6}" x));
        inherit default;
        apply = hex:
          if lib.hasPrefix "#" hex
          then hex
          else "#${hex}";
        description = "Base16 hex color code \"#FFFFFF\"";
      };
  in {
    options.preferences = {
      user = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "src-06";
        };
        fullname = lib.mkOption {
          type = lib.types.str;
          default = "Violet Evergarden";
        };
        home = lib.mkOption {
          type = lib.types.str;
          default = "/home/${cfg.user.name}";
        };
      };

      hostname = lib.mkOption {
        type = lib.types.str;
        default = "NixOS";
      };

      theme = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Base16 theme color";
        };
        colors = {
          base00 = mkColor "#0B0E14"; # Default Background
          base01 = mkColor "#1E222A"; # Lighter Background (status bars, line number and folding marks)
          base02 = mkColor "#2D3340"; # Selection Background
          base03 = mkColor "#454A52"; # Comments, Invisibles, Line Highlighting
          base04 = mkColor "#566974"; # Dark Foreground (status bars)
          base05 = mkColor "#C6BEB7"; # Default Foreground, Caret, Delimiters, Operators
          base06 = mkColor "#EAD6DA"; # Light Foreground (Not often used)
          base07 = mkColor "#FBF5DF"; # Light Background (Not often used)
          base08 = mkColor "#D95757"; # Red (Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted)
          base09 = mkColor "#FFA63A"; # Orange (Integers, Boolean, Constants, XML Attributes, Markup Link Url)
          base0A = mkColor "#FFDA73"; # Yellow (Classes, Markup Bold, Search Text Background)
          base0B = mkColor "#A5F764"; # Green (Strings, Inherited Class, Markup Code, Diff Inserted)
          base0C = mkColor "#85EACB"; # Cyan (Support, Regular Expressions, Escape Characters, Markup Quotes)
          base0D = mkColor "#63B0FF"; # Blue (Functions, Methods, Attribute IDs, Headings)
          base0E = mkColor "#AA86B8"; # Magenta (Keywords, Storage, Selector, Markup Italic, Diff Changed)
          base0F = mkColor "#E6A44A"; # Brown (Deprecated, Opening/Closing Embedded Language Tags)
        };
      };
    };

    config = {
      users.users.${cfg.user.name} = {
        isNormalUser = true;
        home = cfg.user.home;
        description = cfg.user.fullname;
      };

      networking.hostName = cfg.hostname;
    };
  };
}
