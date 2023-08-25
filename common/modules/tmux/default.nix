{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.tmux;

in {
  options.modules.tmux = { enable = mkEnableOption "tmux"; };
  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      historyLimit = 4000;
      keyMode = "vi";
      mouse = true;
      plugins = with pkgs; [
        tmuxPlugins.cpu
        tmuxPlugins.battery
      ];
      extraConfig = ''
        set-option -s set-clipboard off
        bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -i"
        bind-key -T copy-mode-vi y send-keys -X copy-selection
      '';
    };
  };
}
