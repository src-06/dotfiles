{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = [pkgs.bun];
    persistence.cache.dirs = [".bun"];
  };
}
