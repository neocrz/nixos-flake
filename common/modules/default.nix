{ inputs, pkgs, config, ... }:

{
  imports = [
    ./git
    ./bash
    ./packages
  ];
}