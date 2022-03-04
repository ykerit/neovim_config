local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local template = require("user.lsp.lspconfig")
template.setup()

local servers = {"rust_analyzer", "tsserver", "pyright", "clangd"}

for _, server in pairs(servers) do
    require("lspconfig")[server].setup {
        on_attach = template.on_attach,
        capabilities = template.capabilities
    }
end

require("user.lsp.null-ls")
