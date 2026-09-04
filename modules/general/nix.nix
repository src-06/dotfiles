{
  flake.nixosModules.general = {
    outputs,
    config,
    ...
  }: let
    inherit (config.preferences.user) name home;
  in {
    system.stateVersion = "26.05";

    nixpkgs = {
      overlays = [outputs.overlays.default];
      config.allowUnfree = true;
    };

    nix = {
      optimise.automatic = true;

      settings = {
        trusted-users = [
          "root"
          name
        ];

        auto-optimise-store = true;
        keep-derivations = true;
        keep-outputs = true;
        connect-timeout = 5;
        max-jobs = 8;
        cores = 4;

        experimental-features = [
          "nix-command"
          "flakes"
        ];

        extra-substituters = [
          "https://nix-community.cachix.org"
          "https://noctalia.cachix.org"
        ];

        extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };
    };

    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      nh = {
        enable = true;
        flake = "${home}/Projects/Config";
      };

      nix-ld.enable = true;
    };
  };
}
