{ inputs, pkgs, config, ... }:

{
  imports = [
    ./programs
    ./git
  ];
}