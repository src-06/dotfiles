{
  flake.nixosModules.services = {lib, ...}: {
    services.gonic = {
      enable = true;
      settings = {
        db-path = "/var/lib/gonic/gonic.db";
        cache-path = "/var/lib/gonic";
        music-path = ["/mnt/Data/Libraries/Music"];
        playlists-path = "/var/lib/gonic/playlists";
        podcast-path = "/var/lib/gonic/podcasts";
      };
    };

    systemd.services.gonic.serviceConfig.RootDirectory = lib.mkForce "";

    preservation.preserveAt."/persist/system".directories = [
      "/var/lib/gonic"
      "/var/lib/gonic/audio"
      "/var/lib/gonic/covers"
      "/var/lib/gonic/podcasts"
      "/var/lib/gonic/playlists"
    ];
  };
}
