{ inputs, pkgs, lib, config, ... }:

with lib;
let 
  cfg = config.modules.dev;
in {
  imports = [
    ./c
    ./lua
    ./nix
    ./python
    ./rust
  ];

  options.modules.dev = { enable = mkEnableOption "dev"; };
  config = mkIf cfg.enable {
    modules.dev_c.enable = true;
    modules.dev_lua.enable = true;
    modules.dev_nix.enable = true;
    modules.dev_python.enable = true;
    modules.dev_rust.enable = true;
  };
  
}