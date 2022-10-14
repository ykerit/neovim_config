local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- generate plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "akinsho/bufferline.nvim"
    use "tiagovla/scope.nvim"
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use 'karb94/neoscroll.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use 'arkav/lualine-lsp-progress'
    use "ray-x/lsp_signature.nvim" -- for func signature completions
    use 'glepnir/lspsaga.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    -- Git
    use "lewis6991/gitsigns.nvim"

    -- colorscheme
    use 'norcalli/nvim-colorizer.lua'
    use 'ykerit/rich-default'
    use 'Mofiqul/vscode.nvim'
    use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
