{self, ...}: {
  flake.nixosModules.general = {pkgs, ...}: {
    imports = [
      self.nixosModules.base
    ];

    hardware.bluetooth.enable = true;

    networking = {
      networkmanager.enable = true;

      firewall = {
        enable = true;
        allowPing = true;

        # allowedTCPPorts = [
        #   # 80 # http
        #   # 443 # https
        #   3000 # Nuxt, Next.js
        #   5173 # Vite
        #   8888 # My custom server port
        # ];
      };
    };

    time.timeZone = "Asia/Jakarta";
    i18n.defaultLocale = "en_US.UTF-8";

    security.polkit.enable = true;

    services = {
      tuned = {
        enable = true;
        ppdSupport = true;
      };
      upower.enable = true;
    };

    #programs.ssh.startAgent = true;
    #services.gnome.gcr-ssh-agent.enable = false;
    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
      git
      gh

      fd
      ripgrep
      fzf

      jq
      yq
      shellcheck

      file
      which
      lsof
      strace
      p7zip
      unzip
      unrar

      wget
      curl

      openssl
      openssh

      btop
      fastfetch
    ];

    persistence = {
      dirs = [
        "/etc/NetworkManager/system-connections"
        "/etc/tuned"

        "/var/lib/bluetooth"
        "/var/lib/NetworkManager"
      ];

      cache = {
        dirs = [
          ".ssh"
          ".local/share/keyrings"
          ".local/share/applications"
        ];

        files = [
          ".gitconfig"
        ];
      };
    };
  };
}
