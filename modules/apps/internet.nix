{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # Browsers
      zen-browser

      # Discord
      vesktop
    ];

    persistence.cache.dirs = [
      ".config/zen"
      ".config/vesktop"
    ];
  };
}
