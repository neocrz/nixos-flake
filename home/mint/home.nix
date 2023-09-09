{ config, pkgs, ... }:

let
  user = "eee";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = user;
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.05"; # Please read the comment before changing.
  
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.packages = with pkgs; [
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    htop
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "$HOME/.config";
    DOT_FILES = "\${HOME}/.dotfiles";
  };
  imports = [ 
    ./modules
    ../../common/modules
  ];

  modules = {
    programs.enable=true;
    tmux.enable=true;
    vscode.enable=true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
