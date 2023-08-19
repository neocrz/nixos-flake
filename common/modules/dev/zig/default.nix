{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dev_zig;

in {
  options.modules.dev_zig = { enable = mkEnableOption "dev_zig"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zig
    ];
  };
}
  
