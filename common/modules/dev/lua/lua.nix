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
    propagatedBuildInputs = [ luaVer ];

    meta = {
      homepage = "https://github.com/starwing/lpath";
      description = "a OS specific path manipulation module for Lua";
      license.fullName = "MIT/X11";
    };
  };
  l_penlight = buildLuarocksPackage {
    pname = "penlight";
    version = "1.13.1-1";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/penlight-1.13.1-1.rockspec";
      sha256 = "1hn8kcmzb8g5329c13k0ak0mzjm8vn3v07rmnfw621cmpzk30hs4";
    }).outPath;
    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
      "url": "https://github.com/lunarmodules/penlight.git",
      "rev": "3bf03267b2571ba3cfa676a10528dd7b9a0db404",
      "date": "2023-04-30T11:35:23+02:00",
      "path": "/nix/store/j55vz6c2w9s57hfch6r2vr5b4x0lf4x0-penlight",
      "sha256": "0fkhdnjv72ik67pjw994kibp205x6hx809hpq6805bn9jpivk963",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
       }
     '') ["date" "path"]) ;

    propagatedBuildInputs = with luaVerPkgs ; [ luafilesystem ];

    meta = {
      homepage = "https://lunarmodules.github.io/penlight";
      description = "Lua utility libraries loosely based on the Python standard libraries";
      license.fullName = "MIT/X11";
    };
  };

}
