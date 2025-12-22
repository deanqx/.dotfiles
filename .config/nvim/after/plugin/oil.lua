vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = 'File explorer' })

require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
    },
    default_file_explorer = true,
    delete_to_trash = true,
    watch_for_changes = true,
    skip_confirm_for_simple_edits = true,
})
