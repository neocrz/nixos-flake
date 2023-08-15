{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.programs;

in {
    options.modules.programs = { enable = mkEnableOption "programs"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        # cli

        android-tools
        neofetch
        yt-dlp
        xclip
        cmake
        gnumake
        gcc
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
        libreoffice-qt
        tdesktop
        vlc
        # virtualization 
        # distrobox xorg.xhost

        wget curl
	      openssh

        # games
        grapejuice
        golly
        lutris
	    ];
    };
}