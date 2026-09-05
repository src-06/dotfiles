{
  flake.nixosModules.services = {
    programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
