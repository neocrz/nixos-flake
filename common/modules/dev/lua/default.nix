{ inputs, pkgs, lib, config, stdenv, fetchurl, fetchgit, ... }:

with lib;
let 
  cfg = config.modules.dev_lua;
  luaPkgs = (pkgs.callPackage ./lua.nix {});
in
let
  luaWithPackages = (pkgs.lua5_1.withPackages(ps: with ps // luaPkgs; [
    # Builtin Lua Packages
    luasocket
    luafilesystem
    moonscript
    lpeg
    lapis
    ])).override(args: { ignoreCollisions = true; });
in {
  options.modules.dev_lua = { enable = mkEnableOption "dev_lua"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Lua packages
      luaWithPackages # Lua programming language
      stylua # Lua formatter
      selene # Lua linter written in rust
      # # luaformatter # Lua formatter (currently using this one)
      lua-language-server # Lua LSP
      luajitPackages.luarocks-nix # Package manager for Lua on Nix
      terra
      openresty
    ];
  };
}
