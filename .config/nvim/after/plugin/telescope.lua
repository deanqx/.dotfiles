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
end, { desc = 'Search all files in current directory' })
vim.keymap.set('n', '<leader>f', builtin.find_files)
vim.keymap.set('n', '<leader>/', builtin.live_grep)
vim.keymap.set('n', '<leader>t', builtin.treesitter)
vim.keymap.set('n', '<leader>pr', builtin.resume)
