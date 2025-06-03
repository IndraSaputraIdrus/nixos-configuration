{ config, pkgs, ... }:

{
  # nix-ld adalah sebuah utilitas di ekosistem Nix (khususnya NixOS) yang 
  # memungkinkan kamu menjalankan program biner (binary/executable) yang tidak 
  # dibangun menggunakan Nix, tetapi secara otomatis menyediakan pustaka (library) 
  # yang dibutuhkan dari sistem Nix kamu.
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ stdenv.cc.cc zlib ];
}
