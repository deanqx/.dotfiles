local lspconfig = require('lspconfig')

lspconfig.cssls.setup {
    init_options = {
        provideFormatter = false,
    },
    settings = {
        css = {
            lint = {
                unknownAtRules = "ignore"
            }
        }
    },
}
