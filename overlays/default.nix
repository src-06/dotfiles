{inputs, ...}: {
  default = final: prev: let
    zen-browser-pkgs = inputs.zen-browser.packages.${final.stdenv.hostPlatform.system}.default;
  in
    (import ../packages {pkgs = final;})
    // {
      zen-browser = zen-browser-pkgs;
    };
}
