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

vim.keymap.set('n', '<leader>f', function()
    builtin.find_files({
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    })
end)
vim.keymap.set('n', '<leader>/', builtin.live_grep)
vim.keymap.set('n', '<leader>t', builtin.treesitter)
vim.keymap.set('n', '<leader>pr', builtin.resume)
