{
  description = "src-06 NixOS configuration";

  outputs = inputs: let
    inherit (inputs.nixpkgs) lib;
    import-tree = path:
      builtins.filter (
        file: let
          str = toString file;
          base = baseNameOf str;
        in
          lib.hasSuffix ".nix" str
          && base != "flake.nix"
          && !lib.hasInfix "/overlays/" str
          && !lib.hasInfix "/packages/" str
          && !lib.hasInfix "/result/" str
          && !lib.hasInfix "/_" str
          && !lib.hasPrefix "_" base
      ) (lib.filesystem.listFilesRecursive path);
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = import-tree ./.;};

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:src-06/preservation";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #umbriel = {
    #  url = "git+https://github.com/noctalia-dev/umbriel";
    #  inputs = {
    #    nixpkgs.follows = "nixpkgs";
    #    xdg-desktop-portal-umbriel.follows = null;
    #  };
    #};

    #noctalia.url = "github:noctalia-dev/noctalia/cachix";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
