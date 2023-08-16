# structure credits: github.com/novafacing
# basic generation: luarocks nix ...
{pkgs, lib, stdenv, fetchurl, fetchgit, fetchzip, lua52Packages, ... }:
let
  ansicolors = lua52Packages.buildLuarocksPackage {
    pname = "ansicolors";
    version = "1.0.2-3";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/ansicolors-1.0.2-3.rockspec";
      sha256 = "19y962xdx5ldl3596ywdl7n825dffz9al6j6rx6pbgmhb7pi8s5v";
    }).outPath;
    src = fetchurl {
      url    = "https://github.com/kikito/ansicolors.lua/archive/v1.0.2.tar.gz";
      sha256 = "0r4xi57njldmar9pn77l0vr5701rpmilrm51spv45lz0q9js8xps";
    };

    propagatedBuildInputs = with pkgs; [ lua ];

    meta = {
      homepage = "https://github.com/kikito/ansicolors.lua";
      description = "Library for color Manipulation.";
      license.fullName = "MIT <http://opensource.org/licenses/MIT>";
    };
  };
  argparse = lua52Packages.buildLuarocksPackage {
    pname = "argparse";
    version = "0.7.1-1";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/argparse-0.7.1-1.rockspec";
      sha256 = "116iaczq6glzzin6qqa2zn7i22hdyzzsq6mzjiqnz6x1qmi0hig8";
    }).outPath;
    src = fetchzip {
      url    = "https://github.com/luarocks/argparse/archive/0.7.1.zip";
      sha256 = "0idg79d0dfis4qhbkbjlmddq87np75hb2vj41i6prjpvqacvg5v1";
    };

    #disabled = (luaOlder "5.1") || (luaAtLeast "5.5");
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = {
      homepage = "https://github.com/luarocks/argparse";
      description = "A feature-rich command-line argument parser";
      license.fullName = "MIT";
    };
  };
  date = lua52Packages.buildLuarocksPackage {
    pname = "date";
    version = "2.2-2";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/date-2.2-2.rockspec";
      sha256 = "0z2gb4rxfrkdx3zlysmlvfpm867fk0yq0bsn7yl789pvgf591l1x";
    }).outPath;
    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
    "url": "https://github.com/Tieske/date.git",
    "rev": "e309741edc15bde2c884b0db09d8560848773b50",
    "date": "2023-06-19T14:52:25+02:00",
    "path": "/nix/store/mqai2jv2nligylw4bazrk1cw51q493mr-date",
    "sha256": "1s7bz4ivmpyc8mchp4nxm4b1yqf002ryjr30lwdswf64aljlx640",
    "fetchLFS": false,
    "fetchSubmodules": true,
    "deepClone": false,
    "leaveDotGit": false
    }
    '') ["date" "path"]) ;

    # disabled = (luaOlder "5.0") || (luaAtLeast "5.5");
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = {
      homepage = "https://github.com/Tieske/date";
      description = "Date & Time module for Lua 5.x";
      license.fullName = "MIT";
    };
    
  };
  etlua = lua52Packages.buildLuarocksPackage {
    pname = "etlua";
    version = "1.3.0-1";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/etlua-1.3.0-1.rockspec";
      sha256 = "1g98ibp7n2p4js39din2balncjnxxdbaq6msw92z072s2cccx9cf";
    }).outPath;
    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
    "url": "https://github.com/leafo/etlua.git",
    "rev": "8dda2e5aeb4413446172a562a9a374b700054836",
    "date": "2019-08-02T18:07:22-07:00",
    "path": "/nix/store/kk7sib6lwra0wyf6yjc8shkny7b5qnm7-etlua",
    "sha256": "0ns7vvzslxhx39xwhxzi6cwkk2vcxidxidgysr03sq47h8daspig",
    "fetchLFS": false,
    "fetchSubmodules": true,
    "deepClone": false,
    "leaveDotGit": false
    }
    '') ["date" "path"]) ;

    # disabled = (luaOlder "5.1");
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = {
      homepage = "https://github.com/leafo/etlua";
      description = "Embedded templates for Lua";
      license.fullName = "MIT";
    };
  };
  loadkit = lua52Packages.buildLuarocksPackage {
    pname = "loadkit";
    version = "1.1.0-1";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/loadkit-1.1.0-1.rockspec";
      sha256 = "08fx0xh90r2zvjlfjkyrnw2p95xk1a0qgvlnq4siwdb2mm6fq12l";
    }).outPath;
    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
      "url": "https://github.com/leafo/loadkit.git",
      "rev": "c6c712dab45f6c568821f9ed7b49c790a44d12e7",
      "date": "2021-01-07T14:41:10-08:00",
      "path": "/nix/store/xvwq7b2za8ciww1gjw7vnspg9183xmfa-loadkit",
      "sha256": "15znriijs7izf9f6vmhr6dnvw3pzr0yr0mh6ah41fmdwjqi7jzcz",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
    }
    '') ["date" "path"]) ;

    propagatedBuildInputs = with pkgs; [ lua ];

    meta = {
      homepage = "https://github.com/leafo/loadkit";
      description = "Loadkit allows you to load arbitrary files within the Lua package path";
      license.fullName = "MIT";
    };

  };
  lpeg = lua52Packages.buildLuarocksPackage {
    pname = "lpeg";
    version = "1.0.2-1";

    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/lpeg-1.0.2-1.rockspec";
      sha256 = "08a8p5cwlwpjawk8sczb7bq2whdsng4mmhphahyklf1bkvl2li89";
    }).outPath;
    src = fetchurl {
      url    = "http://www.inf.puc-rio.br/~roberto/lpeg/lpeg-1.0.2.tar.gz";
      sha256 = "1zjzl7acvcdavmcg5l7wi12jd4rh95q9pl5aiww7hv0v0mv6bmj8";
    };
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "http://www.inf.puc-rio.br/~roberto/lpeg.html";
      description = "Parsing Expression Grammars For Lua";
      license.fullName = "MIT/X11";
    };
  };
  lua-cjson = lua52Packages.buildLuarocksPackage {
    pname = "lua-cjson";
    version = "2.1.0-1";

    knownRockspec = (fetchurl {
      url    = https://luarocks.org/manifests/openresty/lua-cjson-2.1.0-1.rockspec;
      sha256 = "2ffe98a27d9e93a36711e89f032deab274f670c081f0875a0a055ebb7fb596fb";
    }).outPath;

    src = fetchzip {
      stripRoot = true;
      url = http://www.kyne.com.au/~mark/software/download/lua-cjson-2.1.0.zip;
      sha256 = "0d6zcpqrb0pjmnbfxkk1m1s63wpjjbwgkzndv4f3xczgysxpvi2a";
      postFetch = ''
        chmod go-w $out
      '';
    };

    dontStrip = true;
    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "http://www.kyne.com.au/~mark/software/lua-cjson.php";
      description = "A fast JSON encoding/parsing module";
      license.fullName = "MIT";
    };
  };
  luaossl = lua52Packages.buildLuarocksPackage {
    pname = "luaossl";
    version = "20220711-0";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/luaossl-20220711-0.rockspec";
      sha256 = "0b68kvfz587ilmb5c1p7920kysg9q4m4fl4cz4d93jl3270mzh8y";
    }).outPath;
    src = fetchzip {
      url    = "https://github.com/wahern/luaossl/archive/rel-20220711.zip";
      sha256 = "1a9pgmc6fbhgh1m9ksz9fq057yzz46npqgakcsy9vngg47xacfdb";
    };
    buildInputs = with pkgs; [ openssl.dev ];
    propagatedBuildInputs = with pkgs; [ lua openssl.dev ];
    dontStrip = true;

    meta = {
      homepage = "http://25thandclement.com/~william/projects/luaossl.html";
      description = "Most comprehensive OpenSSL module in the Lua universe.";
      license.fullName = "MIT/X11";
    };

    
    extraVariables = {
      # Dev propagates out
      CRYPTO_DIR = "${pkgs.openssl.dev}";
      OPENSSL_INCDIR = "${pkgs.openssl.dev}/include";
      # Out has libs
      CRYPTO_LIBDIR = "${pkgs.openssl.dev.out}/lib";
      OPENSSL_LIBDIR = "${pkgs.openssl.dev.out}/lib";
    };

  };
  luabitop = lua52Packages.buildLuarocksPackage {
    pname = "luabitop";
    version = "1.0.2-3";

    knownRockspec = (fetchurl {
      url    = https://luarocks.org/manifests/novafacing/luabitop-1.0.2-3.rockspec;
      sha256 = "05jy25ay8h6yp3kz1jai99v5c9k25qyybn12h7pz8gs5k9jsd1br";
    }).outPath;

    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
      "url": "git://github.com/LuaDist/luabitop.git",
      "rev": "81bb23b0e737805442033525de8e6d204d0e5281",
      "sha256": "0lsc556hlkddjbmcdbg7wc2g55bfy743p8ywdzl8x7kk847r043q",
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
      }
    '') ["date"]) ;

    propagatedBuildInputs = with pkgs; [ lua ];

    meta = with lib; {
      homepage = "http://bitop.luajit.org/";
      description = "Lua Bit Operations Module";
      license.fullName = "MIT/X license";
    };
  };
in
let
  pgmoon = lua52Packages.buildLuarocksPackage {
    pname = "pgmoon";
    version = "1.16.0-1";
    knownRockspec = (fetchurl {
      url    = "mirror://luarocks/pgmoon-1.16.0-1.rockspec";
      sha256 = "0qibc6pbal0n5p7c0v0rxrc2b3qdkbbz5wpn4nihsv7vkhjaqhx8";
    }).outPath;
    src = fetchgit ( removeAttrs (builtins.fromJSON ''{
      "url": "https://github.com/leafo/pgmoon.git",
      "rev": "7b7ef2a3f17d32881c61f0fb258d2ee01718942c",
      "date": "2022-11-22T14:49:59-08:00",
      "path": "/nix/store/jjyf1rij16mlqfx55rrpwadcnn8mf663-pgmoon",
      "sha256": "1ifivvkkqwcgp9s9ynlb394973mbhwgs9yvalbyn3170n78msacb",
      "fetchLFS": false,
      "fetchSubmodules": true,
      "deepClone": false,
      "leaveDotGit": false
    }'') ["date" "path"]) ;

    #disabled = (luaOlder "5.1");
    propagatedBuildInputs = with pkgs; [ lua luabitop lpeg openssl.dev ];

    meta = {
      homepage = "https://github.com/leafo/pgmoon";
      description = "Postgres driver for OpenResty and Lua";
      license.fullName = "MIT";
    };
    
  };
in
  {
    lapis = lua52Packages.buildLuarocksPackage {
      pname = "lapis";
      name = "lapis";
      version = "1.14.0-1";
      knownRockspec = (fetchurl {
        url    = "mirror://luarocks/lapis-1.14.0-1.rockspec";
        sha256 = "1iax1n4nfk81vlslnb92wnpg03scci7p7983dwvkhk5nan63vnmh";
      }).outPath;

      src = fetchgit ( removeAttrs (builtins.fromJSON ''{
        "url": "https://github.com/leafo/lapis.git",
        "rev": "fce55fddfafca91b12fcbf21e9ac322ad68fa22e",
        "date": "2023-07-20T12:10:03-07:00",
        "path": "/nix/store/ggb7qsjbqcj5d6qs31mcllawzgazlk2m-lapis",
        "sha256": "0qnz6arsqyr3scsz7zd9a6qwpjha2x6k3ymkk20nm74a2s7v8yz1",
        "fetchLFS": false,
        "fetchSubmodules": true,
        "deepClone": false,
        "leaveDotGit": false
      }
      '') ["date" "path"]) ;

      propagatedBuildInputs = with pkgs; with lua52Packages; [ lua argparse ansicolors date etlua loadkit lpeg lua-cjson luaossl luafilesystem luasocket pgmoon ] ++ (with pkgs; [ wget curl ]);

      meta = with lib; {
        homepage = "http://leafo.net/lapis";
        description = "A web framework for MoonScript & Lua";
        license.fullName = "MIT";
      };
    };
  }
