{
  flake.nixosModules.devs = {pkgs, ...}: {
    environment.systemPackages = [pkgs.python314];
  };
}
