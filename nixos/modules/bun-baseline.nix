# source: https://github.com/NixOS/nixpkgs/blob/nixos-25.05/pkgs/by-name/bu/bun/package.nix
{ pkgs, ... }:

pkgs.stdenvNoCC.mkDerivation rec {
  pname = "bun-baseline";
  version = "1.2.20";
  fileName = "bun-linux-x64-baseline";

  src = pkgs.fetchurl {
    url =
      "https://github.com/oven-sh/bun/releases/download/bun-v${version}/${fileName}.zip";
    hash = "sha256-s+X6wlJJDZi9fNTyCcYGCNNzV21+GXBmG51QJ4M7Iuw=";
  };

  # Dependency saat instalasi
  nativeBuildInputs = [ pkgs.unzip pkgs.autoPatchelfHook ];
  buildInputs = [ pkgs.openssl ];

  dontConfigure = true;
  dontBuld = true;

  # Instruksi instalasi
  installPhase = ''
    runHook preInstall

    install -Dm 755 ./bun $out/bin/bun
    ln -s $out/bin/bun $out/bin/bunx

    runHook postInstall
  '';

  # Mendukung platform yang berbeda
  meta = {
    description = "A fast all-in-one JavaScript runtime";
    homepage = "https://bun.sh/";
    platforms = [ "x86_64-linux" ];
  };
}
