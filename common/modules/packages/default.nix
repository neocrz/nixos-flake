{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.packages;

in {
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [
        # tools
        bat
        blesh
        exa # ls alt
        fd # find alt
        ffmpeg
        htop
        nano
        neofetch
        ripgrep # grep alt
        openssl_legacy
	      openssh
        yt-dlp
        wget curl
        zoxide # cd alt
        unzip

	    ];
    };
}