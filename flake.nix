{
  description = "src-06 NixOS configuration";

  outputs = inputs: let
    inherit (inputs.nixpkgs.lib) filesystem hasPrefix hasInfix hasSuffix;
    import-tree = path:
      builtins.filter (
        file: let
          str = toString file;
          base = baseNameOf str;
        in
          hasSuffix ".nix" str
          && base != "flake.nix"
          && !hasInfix "/overlays/" str
          && !hasInfix "/packages/" str
          && !hasInfix "/result/" str
          && !hasInfix "/_" str
          && !hasPrefix "_" base
      ) (filesystem.listFilesRecursive path);
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

    umbriel = {
      url = "github:noctalia-dev/umbriel";
      #url = "git+https://github.com/noctalia-dev/umbriel";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        xdg-desktop-portal-umbriel.follows = "";
      };
    };

    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "";
      };
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
