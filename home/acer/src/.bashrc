export XDG_DATA_HOME="$HOME/.local/share"
export TERM="kitty"
export LIX_STORE="$HOME/.lix/store"

alias ktyctheme="nix-shell $DOT_FILES/home/acer/src/kitty-theme.nix"
alias ktytheme="kitty +kitten themes";
eval "$(zoxide init bash)"

