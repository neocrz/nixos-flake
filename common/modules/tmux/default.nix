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
      mouse = true;
      plugins = with pkgs; [
        tmuxPlugins.cpu
        tmuxPlugins.battery
      ];
    };
  };
}