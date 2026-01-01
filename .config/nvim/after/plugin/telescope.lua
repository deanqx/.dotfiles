require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden'
        }
    }
}

local builtin = require('telescope.builtin')

-- Search all files (https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md)
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        find_command = { 'rg', '--files', '-uu', '-g', '!.git' },
    })
end, { desc = 'Telescope: Fuzzy find files including hidden files' })
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope: Fuzzy find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope: Fuzzy find file content' })
vim.keymap.set('n', '<leader>t', builtin.treesitter, { desc = 'Telescope: Show symbols of file' })
vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Telescope: Continue last fuzzy find' })
