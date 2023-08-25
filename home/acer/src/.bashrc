export XDG_DATA_HOME="$HOME/.local/share"
export TERM="kitty"
export LIX_STORE="$HOME/.lix/store"

alias ktyctheme="nix-shell $DOT_FILES/home/acer/src/kitty-theme.nix"
alias ktytheme="kitty +kitten themes";
alias flake_switch="sudo nixos-rebuild --flake $DOT_FILES/.#acer switch"
eval "$(zoxide init bash)"
alias lix="/home/eee/Projects/lua/l007-lix/lix"
