{inputs, ...}: {
  default = final: prev: let
    system = final.stdenv.hostPlatform.system;
    zen-browser-pkgs = inputs.zen-browser.packages.${system}.default;
  in
    (import ../packages {pkgs = final;})
    // {
      zen-browser = zen-browser-pkgs;
    };
}
