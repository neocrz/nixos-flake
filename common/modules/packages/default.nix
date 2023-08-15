{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.packages;

in {
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        # tools
        bat
        exa # ls alt
        fd # find alt
        htop
        nano
        neofetch
        ripgrep # grep alt
	      openssh
        yt-dlp
        wget curl
        zoxide # cd alt
        unzip

        # dev
        cmake
        gnumake
        gcc
	    ];
    };
}