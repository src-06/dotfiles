{
  lib,
  stdenvNoCC,
  makeWrapper,
  fetchFromGitHub,
  fetchPnpmDeps,
  pnpmConfigHook,
  nodejs_24,
  pnpm_10,
}:
stdenvNoCC.mkDerivation rec {
  pname = "unocss-language-server";
  version = "0.1.9";

  src = fetchFromGitHub {
    owner = "xna00";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-t4Qa1atVXB1EZRdJ0eDzeoYsuIzNE5sLMbLZp45EKKE=";
  };

  nativeBuildInputs = [
    nodejs_24
    pnpm_10
    pnpmConfigHook
    makeWrapper
  ];

  prePnpmInstall = "";

  pnpmDeps = fetchPnpmDeps {
    inherit
      pname
      version
      src
      prePnpmInstall
      ;
    pnpm = pnpm_10;
    fetcherVersion = 3;
    hash = "sha256-vGSr+nLtV189QVoe1cKZoX+sUhTlqOe+EgurnXHCILY=";
  };

  buildPhase = ''
    runHook preBuild
    pnpm run build
    runHook postBuild
  '';

  postBuild = ''
    pnpm prune --prod
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mkdir -p $out/lib/${pname}

    cp -r out $out/lib/${pname}/
    cp -r node_modules $out/lib/${pname}/

    makeWrapper ${nodejs_24}/bin/node \
      $out/bin/unocss-language-server \
      --set NODE_PATH $out/lib/${pname}/node_modules \
      --add-flags $out/lib/${pname}/out/server.js

    runHook postInstall
  '';

  meta = {
    description = "UnoCSS Language Server";
    mainProgram = pname;
    license = lib.licenses.mit;
    homepage = "https://github.com/xna00/unocss-language-server";
  };
}
