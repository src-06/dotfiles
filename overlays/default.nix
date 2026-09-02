{inputs, ...}: {
  default = final: _: let
    system = final.stdenv.hostPlatform.system;
  in
    (import ../packages {pkgs = final;})
    // {
      zen-browser = inputs.zen-browser.packages.${system}.default;
      vscode-marketplace = inputs.nix-vscode-extensions.extensions.${system}.vscode-marketplace;
    };
}
