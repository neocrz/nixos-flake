
{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kitty;

in {
  options.modules.kitty = { enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    home.file.".config/kitty" = {
      source = ./kitty;
      recursive = true;
    };
    
    programs.kitty.enable = true;
    home.packages = with pkgs; [
      kitty-themes #themes
      pixcat #images
      termpdfpy #pdf

    ];
  };
}
