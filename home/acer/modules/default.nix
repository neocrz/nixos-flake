{ inputs, pkgs, config, ... }:

{
  imports = [
    ./kitty
    ./programs
    ./vscode
  ];
}