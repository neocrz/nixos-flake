{ inputs, config, pkgs, ... }: 
let
  name = "eee";
in
{
  home = {
    #username = name;
    #homeDirectory = "/home/${name}";
    stateVersion = "23.05";
    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = rec {
      DOT_FILES = "\${HOME}/.dotfiles";
      XDG_CACHE_HOME  = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME    = "\${HOME}/.local/bin";
      XDG_DATA_HOME   = "\${HOME}/.local/share";
    };
  };


  imports = [ 
    ./modules
    ../../common/modules

    ( _:{ # copy my bashrc to be sourced
      home.file.".config/.mybashrc" = {
      source = ./src/mybashrc;
      recursive = true;
      };
      }
    )
  ];

  modules = {
    git.enable=true;
    bash.enable=true;
    packages.enable=true;
    programs.enable=true;
    dev.enable=true;
  };
  
  programs = {
    home-manager.enable = true;
  };

  

}