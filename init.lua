require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.colorscheme"
require "user.lsp"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.gitsigns"
require "user.bufferline"
require "user.lualine"

-- Exempt from configuring plugins
require("scope").setup()
