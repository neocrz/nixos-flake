{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dev_nix;

in {
  options.modules.dev_nix = { enable = mkEnableOption "dev_nix"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Nix Packages
      alejandra # Nix formatter written in Rust
      statix # Lints and suggestions for the nix programming language
      nil # Nix LSP
      # Nix utils
      nix-init # Command line tool to generate Nix packages from URLs
      nix-prefetch-git # Script used to obtain source hashes for fetchgit
    ];
  };
}
