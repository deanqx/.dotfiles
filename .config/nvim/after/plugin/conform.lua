require("conform").setup({
  formatters_by_ft = {
    yaml = { "yamlfmt" },
    astro = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
