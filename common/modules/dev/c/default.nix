{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dev_c;

in {
  options.modules.dev_c = { enable = mkEnableOption "dev_c"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      cmake
      gnumake
      gcc
      # C/C++ Packages
      astyle # Source code indenter, formatter, and beautifier for C, C++, C# and Java
      cpplint # Static code checker for C/C++
      clang-tools 
    ];
  };
}