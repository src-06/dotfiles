{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [nodejs_24 pnpm_11];
    persistence.cache.dirs = [".local/share/pnpm/store"];
  };
}
