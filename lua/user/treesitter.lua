local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

require("colorizer").setup()
require("indent_blankline").setup()

configs.setup({
	ensure_installed = { "tsx", "toml", "json", "yaml", "html", "scss", "rust", "cpp", "go", "python", "wgsl" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "yaml" },
	},
})
