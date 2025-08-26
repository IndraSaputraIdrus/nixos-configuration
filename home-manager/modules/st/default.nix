{ config, pkgs, ... }:

let
  fetchpatch = pkgs.fetchpatch;

  stDesktopContent = ''
    [Desktop Entry]
    Encoding=UTF-8
    Version=1.0
    Type=Application
    Terminal=false
    Name=ST Terminal
    Exec=st
    Icon=utilities-terminal
  '';

  scrollBack = (fetchpatch {
    url =
      "https://st.suckless.org/patches/scrollback/st-scrollback-ringbuffer-0.9.2.diff";
    sha256 = "1r23q4mi5bkam49ld5c3ccwaa1li7bbjx0ndjgm207p02az9h4cn";
  });

  mouseScroll = (fetchpatch {
    url =
      "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-0.9.2.diff";
    sha256 = "068s5rjvvw2174y34i5xxvpw4jvjy58akd1kgf025h1153hmf7jy";
  });

  ligatures = (fetchpatch {
    url =
      "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-scrollback-ringbuffer-20241226-0.9.2.diff";
    sha256 = "1q5hldq7p15l4nfz4ybhf78mnxk2mqlksp8w1rv1yvcc30jmzszs";
  });

  stPatched = (pkgs.st.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs ++ [ pkgs.harfbuzz ];
    patches = [ scrollBack mouseScroll ligatures ];
    configFile =
      pkgs.writeText "config.def.h" (builtins.readFile ./st-config.h);
    prePatch = ''
      cp ${configFile} config.def.h
    '';
  }));

in {
  home.packages = with pkgs; [
    stPatched
  ];

  home.file = {
    ".local/share/applications/st.desktop".source =
      pkgs.writeText "st-desktop" stDesktopContent;
  };
}
