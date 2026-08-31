{
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      pulseaudio
      wl-mirror
    ];

    programs.noctalia.enable = true;

    persistence.data.dirs = [
      ".local/state/noctalia"
    ];
  };
}
