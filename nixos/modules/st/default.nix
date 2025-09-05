{ pkgs, ... }:

let
  fetchpatch = pkgs.fetchpatch;
  scrollBack = ./patch/st-scrollback-ringbuffer-0.9.2.diff;
  mouseScroll = ./patch/st-scrollback-mouse-0.9.2.diff;
  ligatures = ./patch/st-ligatures-scrollback-ringbuffer-20241226-0.9.2.diff;
in pkgs.st.overrideAttrs (oldAttrs: rec {
  buildInputs = oldAttrs.buildInputs ++ [ pkgs.harfbuzz ];
  patches = [ scrollBack mouseScroll ligatures ];
  configFile = pkgs.writeText "config.def.h" (builtins.readFile ./config.def.h);
  prePatch = ''
    cp ${configFile} config.def.h
  '';
})
