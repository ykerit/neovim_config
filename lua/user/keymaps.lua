local opts = {
    noremap = true,
    silent = true
}

local term_opts = {
    silent = true
}

local saga = require('lspsaga')
saga.init_lsp_saga()

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>:w<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- Bufferline
keymap("n", "<leader>b", ":BufferLinePickClose<cr>", opts)
keymap("n", "[b", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "]b", ":BufferLineCycleNext<cr>", opts)

-- LspSaga
keymap("n", "<leader>ga", "<cmd>Lspsaga code_action<CR>", { silent = true })
keymap("v", "<leader>ga", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "<leader>gp", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

