{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nginx
      mariadb_114
      php84
      php84Packages.composer
      process-compose
    ];
  };
}
