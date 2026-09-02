{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # Browsers
      zen-browser

      # Discord
      vesktop
    ];

    xdg.mime.removedAssociations."text/xml" = "zen.desktop";

    persistence.cache.dirs = [
      ".config/zen"
      ".config/vesktop"
    ];
  };
}
