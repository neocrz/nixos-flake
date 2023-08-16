{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dev_lua;

in {
  options.modules.dev_lua = { enable = mkEnableOption "dev_lua"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Lua packages
      lua # Lua programming language
      stylua # Lua formatter
      selene # Lua linter written in rust
      # luaformatter # Lua formatter (currently using this one)
      lua-language-server # Lua LSP
      luajitPackages.luarocks-nix # Package manager for Lua on Nix
    ];
  };
}
