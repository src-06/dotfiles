{
  self,
  inputs,
  ...
}: {
  systems = ["x86_64-linux"];

  perSystem = {
    pkgs,
    system,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    formatter = pkgs.alejandra;
  };

  flake = let
    inherit (inputs.nixpkgs) lib;

    mkHost = host: cfg:
      lib.nixosSystem {
        inherit (cfg) system;
        specialArgs = {
          inherit inputs;
          system = cfg.system;
          outputs = self.outputs;
        };
        modules = cfg.modules;
      };

    listHost = {
      laptop = {
        system = "x86_64-linux";
        modules = [
          self.nixosModules.laptop
        ];
      };
    };
  in {
    overlays = import ./overlays {
      inherit inputs;
    };

    nixosConfigurations = lib.mapAttrs mkHost listHost;
  };
}
