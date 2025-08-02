vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = 'Explore project folder' })
vim.keymap.set("n", "U", "<C-r>", { desc = 'Redo undo' })

-- Lock cursor and keep cursor in center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Go down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Go up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Go to next' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Go to previous' })

-- without losing buffer
vim.keymap.set("n", "<leader>d", "\"_d", { desc = 'd without losing buffer' })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = 'd without losing buffer (visual mode)' })
vim.keymap.set("n", "<leader>D", "\"_D", { desc = 'D without losing buffer' })
vim.keymap.set("n", "<leader>x", "\"_x", { desc = 'x without losing buffer' })
vim.keymap.set("n", "<leader>X", "\"_X", { desc = 'X without losing buffer' })
vim.keymap.set("n", "<leader>s", "\"_s", { desc = 's without losing buffer' })
vim.keymap.set("n", "<leader>S", "\"_S", { desc = 'S without losing buffer' })
vim.keymap.set("n", "<leader>c", "\"_c", { desc = 'c without losing buffer' })
vim.keymap.set("n", "<leader>C", "\"_C", { desc = 'C without losing buffer' })

-- System clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = 'Copy to clipboard' })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = 'Copy to clipboard (visual mode)' })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = 'Copy to clipboard' })

vim.keymap.set("n", "Q", "<nop>", { desc = 'Unused' })
