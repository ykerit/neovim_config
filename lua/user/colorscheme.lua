vim.cmd [[
try
  "colorscheme nightfox
  " colorscheme melange
  " colorscheme night-owl
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
