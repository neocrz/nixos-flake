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
        android-studio #dev
        blender
        calibre
        discord
        figma-linux #design
        firefox
        genymotion #dev
        glmark2
        gimp
        inkscape #design
        krita
        libreoffice-qt
        librewolf
        lmms
        love #dev
        metabase #powerbi alt.
        obs-studio #rec
        obsidian #note
        openshot-qt #video
        qbittorrent
        qutebrowser
        scrcpy #phone screen
        shotcut #video
        tdesktop
        thunderbird
        typst
        vlc
        wineWowPackages.stable
        woeusb-ng
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
