{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nginx
      mariadb
      php84
      php84Packages.composer
      process-compose
    ];
  };
}
