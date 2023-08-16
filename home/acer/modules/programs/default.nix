{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.programs;

in {
    options.modules.programs = { enable = mkEnableOption "programs"; };
    config = mkIf cfg.enable {
      home.packages = (with pkgs; [
        audacity
        android-tools
        xclip
        mpv
        android-studio
        blender
        calibre
        discord
        figma-linux
        firefox
        glmark2
        gimp
        inkscape
        libreoffice-qt
        lmms
        metabase #powerbi alt.
        obs-studio
        obsidian
        openshot-qt #video
        qbittorrent
        qutebrowser
        shotcut #video
        tdesktop
        thunderbird
        typst
        vlc
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

        
        gnomeExtensions.gsconnect
	    ]) ++ (with pkgs.gnome; [ 
        nautilus
        zenity
        gnome-tweaks
        eog
        gedit
      ]);
    };
}