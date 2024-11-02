local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>b", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>o", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>m", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>t", function() harpoon:list():select(4) end)
