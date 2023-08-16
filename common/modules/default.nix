{ inputs, pkgs, config, ... }:

{
  imports = [
    ./git
    ./bash
    ./packages
    ./dev
  ];
}