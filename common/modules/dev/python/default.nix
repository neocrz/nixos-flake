{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dev_python;

in {
  options.modules.dev_python = { enable = mkEnableOption "dev_python"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      (python311.withPackages (ps:
        with ps; [
          pip
          black # Python formatter
          pynvim
          flake8 # Linter for Python
        ]
      ))
    ];
  };
}