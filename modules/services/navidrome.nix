{
  flake.nixosModules.services = {
    services.navidrome = {
      enable = true;
      settings = {
        Address = "127.0.0.1";
        Port = 4533;
        EnableInsightsCollector = false;
        MusicFolder = "/mnt/Data/Libraries/Music";
        PlaylistsPath = "/mnt/Data/Libraries/Music/Playlists";
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
