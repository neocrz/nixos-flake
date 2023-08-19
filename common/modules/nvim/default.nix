{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {
      home.file.".config/nvim/lua" = {
         source = ./lua;
         recursive = true;
      };

      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        extraConfig = ''
          luafile ~/.config/nvim/lua/settings.lua
        '';

        extraPackages = with pkgs; [
          tree-sitter
        ];

        plugins = with pkgs.vimPlugins; [
          # File
          nvim-web-devicons
          {
            plugin = nvim-tree-lua;
            config = ''
              lua require("nvim-tree").setup()
            '';
          }

          vim-nix

          nvim-treesitter.withAllGrammars
      ];
      };
      
    };
}