{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      opencode
      sql-studio
    ];

    programs = {
      localsend = {
        enable = true;
        openFirewall = true;
      };

      obs-studio.enable = true;
    };

    persistence.cache.dirs = [
      ".local/share/opencode"
      ".local/state/opencode"
    ];
  };
}
