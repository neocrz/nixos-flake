{ inputs, pkgs, config, ... }:

{
  imports = [
    ./bash
    ./dev
    ./fonts
    ./git
    ./nano
    ./nvim
    ./packages
    ./tmux
  ];
}