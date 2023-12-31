{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.bash;

in {
  options.modules.bash = { enable = mkEnableOption "bash"; };
  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        mp3 = "yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0";
        mp4 = "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4";
      };
      # source my manual config
      bashrcExtra = ''
        . ~/.config/.mybashrc
      '';
    };

    
    
  };
}
