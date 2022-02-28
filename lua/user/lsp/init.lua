local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

local user = require("user.lsp.lspconfig")

local servers = {"rust_analyzer", "tsserver", "pyright", "clangd"}

for _, server in pairs(servers) do
    lsp[server].setup = user.setup
    lsp[server].setup()
end

require("user.lsp.null-ls")
