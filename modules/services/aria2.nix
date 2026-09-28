{
  flake.nixosModules.services = {lib, ...}: {
    services.aria2 = {
      enable = true;
      rpcSecretFile = "/persist/rpcSecret";
      settings = {
        rpc-allow-origin-all = true;
        rpc-listen-all = true;
        continue = true;
        split = 16;
        max-connection-per-server = 16;
        max-concurrent-downloads = 5;
        min-split-size = "5M";
        file-allocation = "falloc";
        #user-agent = "Mozilla/5.0 (X11; Linux x86_64; rv:130.0) Gecko/20100101 Firefox/130.0";
      };
    };

    systemd.services.aria2.serviceConfig = with lib; {
      User = mkForce "src-06";
      Group = mkForce "users";
    };

    users.extraGroups.aria2.members = ["src-06"];
  };
}
