{ inputs, pkgs, config, ... }:

{
  imports = [
    ./bash
    ./dev
    ./fonts
    ./git
    ./nano
    ./packages
    ./tmux
  ];
}