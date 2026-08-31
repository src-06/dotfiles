{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [nodejs pnpm];
    persistence.cache.dirs = [".local/share/pnpm/store"];
  };
}
