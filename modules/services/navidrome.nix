{
  flake.nixosModules.services = {
    services.navidrome = {
      enable = true;
      settings = {
        EnableInsightsCollector = false;
        MusicFolder = "/mnt/Data/Libraries/Music";
        Backup.Path = "";
        Plugins.Enabled = false;
      };
    };

    preservation.preserveAt."/persist/system".directories = [
      {
        directory = "/var/lib/navidrome";
        user = "navidrome";
        group = "navidrome";
        mode = "0700";
      }
    ];
  };
}
