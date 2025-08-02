vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "U", "<C-r>")

-- Move line (currently disabled because copyng seems prefered)
-- vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv")

-- Lock cursor and keep cursor in center
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- without losing buffer
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>D", "\"_D")
vim.keymap.set("n", "<leader>x", "\"_x")
vim.keymap.set("n", "<leader>X", "\"_X")
vim.keymap.set("n", "<leader>s", "\"_s")
vim.keymap.set("n", "<leader>S", "\"_S")
vim.keymap.set("n", "<leader>c", "\"_C")
vim.keymap.set("v", "<leader>d", "\"_d")

-- System clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Ex Mode is not useful
vim.keymap.set("n", "Q", "<nop>")
