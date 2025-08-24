# source: https://github.com/NixOS/nixpkgs/blob/nixos-25.05/pkgs/by-name/bu/bun/package.nix
{ lib, config, pkgs, ... }:

let
  bunBaseline = pkgs.stdenvNoCC.mkDerivation rec {
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

    # Instruksi instalasi
    installPhase = ''
      unzip $src
      mkdir -p $out/bin

      # Salin bun
      cp ${fileName}/bun $out/bin/bun

      # Buat symlink untuk bunx
      ln -s $out/bin/bun $out/bin/bunx

      chmod +x $out/bin/bun
    '';

    # Mendukung platform yang berbeda
    meta = with lib; {
      description = "A fast all-in-one JavaScript runtime";
      homepage = "https://bun.sh/";
      license = licenses.mit;
      platforms =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      maintainers = with maintainers; [ ];
    };
  };
in { home.packages = [ bunBaseline ]; }
