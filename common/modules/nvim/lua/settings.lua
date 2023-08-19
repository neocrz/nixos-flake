local opt = vim.opt
local g = vim.g


local lua_path = os.getenv("XDG_CONFIG_HOME") .. "/neovim/lua/?.lua"

package.path = package.path .. ";" .. lua_path
print("Hello world!")