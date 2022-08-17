vim.g.catppuccin_flavour = "mocha" 

require("catppuccin").setup({
    term_colors = true,
    styles = {
        comments = {"italic"},
        conditionals = {"italic"},
    },
    integrations = {
        lsp_saga = true,
        gitsigns = true,
    }
})

vim.cmd [[colorscheme catppuccin]]
