{
  flake.nixosModules.general = {
    security.rtkit.enable = true;

    services = {
      pulseaudio.enable = false;

      pipewire = {
        enable = true;

        alsa.enable = true;
        alsa.support32Bit = true;

        pulse.enable = true;
        # jack.enable = true;
      };
    };

    persistence.cache.dirs = [
      ".local/state/wireplumber"
    ];
  };
}
