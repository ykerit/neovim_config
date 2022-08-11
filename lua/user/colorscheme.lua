vim.cmd [[
try
  "colorscheme nightfox
  " colorscheme melange
  " colorscheme night-owl
  colorscheme rich-default
  " colorscheme tokyonight
  " colorscheme oxocarbon-lua
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
vim.g.oxocarbon_lua_disable_italic = true

