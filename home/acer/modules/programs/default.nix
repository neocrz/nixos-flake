{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.programs;

in {
    options.modules.programs = { enable = mkEnableOption "programs"; };
    config = mkIf cfg.enable {
      home.packages = (with pkgs; [
        #DS
        metabase

        # CLI
        android-tools
        xclip
        mpv

        # GUI
        android-studio
        calibre
        discord
        glmark2
        obs-studio
        obsidian
        qbittorrent
        firefox
        qutebrowser
        figma-linux
        libreoffice-qt
        tdesktop
        vlc
        xpdf
        # virtualization 
        # distrobox xorg.xhost

        # GAMES
        grapejuice
        golly
        lutris
        (retroarch.override {
          cores = with libretro; [
            # beetle-gba
            # beetle-psx-hw
            # beetle-snes
            # beetle-wswan
            # citra
            # desmume
            # dolphin
            # genesis-plus-gx
            # mame
            melonds
            mgba
            # mupen64plus
            # neocd
            # parallel-n64
            # pcsx-rearmed
            # pcsx2
            ppsspp
            # snes9x
            # tic80
            swanstation
          ];
        })

	    ]) ++ (with pkgs.gnome; [ 
        nautilus
        zenity
        gnome-tweaks
        eog
        gedit
      ]);
    };
}