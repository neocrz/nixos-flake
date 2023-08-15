{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.programs;

in {
    options.modules.programs = { enable = mkEnableOption "programs"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        # cli
        android-tools
        bat fd ripgrep
        neofetch
        yt-dlp
        xclip
        cmake
        gnumake
        gcc
        mpv

        # virtualization 
        # distrobox xorg.xhost

        wget curl
	      openssh

	    ];
    };
}