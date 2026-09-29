{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [nodejs_24 pnpm];
    persistence.cache.dirs = [".local/share/pnpm/store"];
  };
}
