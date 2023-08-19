{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.dev_rust;

in {
  options.modules.dev_rust = { enable = mkEnableOption "dev_rust"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      lldb # A next-generation high-performance debugger
      rustc # Compiler for rust
      cargo # Downloads your Rust project's dependencies and builds your project
      rustfmt # Formatter for rust language
      rust-analyzer # Lsp for rust
      clippy # Linter
      # rustup # The Rust toolchain installer
    ];
  };
}
  
