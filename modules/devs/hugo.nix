{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = [pkgs.hugo];
  };
}
