{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.programs;

in {
    options.modules.programs = { enable = mkEnableOption "programs"; };
    config = mkIf cfg.enable {
      home.packages = (with pkgs; [
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
        libreoffice-qt
        tdesktop
        vlc
        # virtualization 
        # distrobox xorg.xhost

        # games
        grapejuice
        golly
        lutris
	    ]) ++ (with pkgs.gnome; [ 
        nautilus
        zenity
        gnome-tweaks
        eog
        gedit
      ]);
    };
}