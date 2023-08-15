{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.programs;

in {
    options.modules.programs = { enable = mkEnableOption "programs"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        # cli

        android-tools
        xclip
        
        mpv

        # gui
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
        # gnome.nautilus
        gnome.zenity
        gnome.gnome-tweaks
        # gnome.eog
        # gnome.gedit
        libreoffice-qt
        tdesktop
        vlc
        # virtualization 
        # distrobox xorg.xhost

        # games
        grapejuice
        golly
        lutris
	    ];
    };
}