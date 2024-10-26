local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        hidden = true,     -- Search hidden files
        follow = true,     -- Follow symlinks
        no_ignore = false, -- Ignore .gitignore
    })
end, { desc = "Project Find Files" })
vim.keymap.set('n', '<leader>ps', builtin.live_grep)
vim.keymap.set('n', '<leader>pr', builtin.resume)
