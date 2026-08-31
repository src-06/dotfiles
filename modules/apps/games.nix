{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      faugus-launcher
      (prismlauncher.override {jdks = [pkgs.zulu21];})
    ];

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam.enable = true;
    };

    persistence = {
      cache.dirs = [
        ".steam"
        ".local/share/Steam"
        ".local/share/umu"
      ];

      data.dirs = [
        ".config/faugus-launcher"
        ".local/share/faugus-launcher"
        ".local/share/PrismLauncher"
      ];
    };
  };
}
