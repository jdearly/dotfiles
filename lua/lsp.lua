-- LSPs
local lsp = require('lspconfig')
lsp.tsserver.setup{}
lsp.clangd.setup {}
lsp.pyls.setup{}
lsp.yamlls.setup{}
lsp.gopls.setup{
    on_attach=on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
