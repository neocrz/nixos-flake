# structure credits: github.com/novafacing
# basic generation: luarocks nix ...
{pkgs, lib, stdenv, fetchurl, fetchgit, fetchzip, luaVer, ... }:
let
  luaVerPkgs = luaVer.pkgs;
in let
  inherit (luaVerPkgs) luaOlder luaAtLeast buildLuarocksPackage;
  lua = luaVer;
in {
  lpath = buildLuarocksPackage {
    pname = "lpath";
    version = "0.4.0-1";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/lpath-0.4.0-1.rockspec";
      sha256 = "1jqfz9269kgn8nwpmrjw1vja0qc5khg37z5lvc2gb4n6inainlza";
    }).outPath;
    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
    "url": "https://github.com/starwing/lpath.git",
    "rev": "953476ee2c3b823a8a10f1d1e62d843daa088795",
    "date": "2023-01-27T10:51:59+08:00",
    "path": "/nix/store/3298fwhv8f4rwpqf7fgp8g959s0wfhp5-lpath",
    "sha256": "0a5jxm853lj2qs2gbsz9339nrbkqhffzkabi4a20ssm9h6a0fbfl",
    "fetchLFS": false,
    "fetchSubmodules": true,
    "deepClone": false,
    "leaveDotGit": false
    }'') ["date" "path"]) ;

    disabled = (luaOlder "5.1");
    propagatedBuildInputs = [ lua ];

    meta = {
      homepage = "https://github.com/starwing/lpath";
      description = "a OS specific path manipulation module for Lua";
      license.fullName = "MIT/X11";
    };
  };
}
