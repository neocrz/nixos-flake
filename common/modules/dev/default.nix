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
    ./zig
  ];

  options.modules.dev = { enable = mkEnableOption "dev"; };
  config = mkIf cfg.enable {
    modules.dev_c.enable = false;
    modules.dev_lua.enable = false;
    modules.dev_nix.enable = false;
    modules.dev_python.enable = false;
    modules.dev_rust.enable = false;
    modules.dev_zig.enable = false;
  };
  
}