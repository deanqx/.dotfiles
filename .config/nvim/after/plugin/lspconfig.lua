local lspconfig = require('lspconfig')

lspconfig.cssls.setup {
    init_options = {
        provideFormatter = false,
    },
}
