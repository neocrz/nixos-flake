{ inputs, pkgs, lib, config, stdenv, fetchurl, fetchgit, ... }:

with lib;
let 
  cfg = config.modules.dev_lua;
  luaVer = pkgs.luajit; #lua5_1
  luaPkgs = (pkgs.callPackage ./lua.nix { inherit luaVer; });
in
let
  luaWithPackages = (luaVer.withPackages(ps: with ps // luaPkgs; [
    # Builtin Lua Packages
    luasocket
    luafilesystem
    lpeg
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
    ];
  };
}
