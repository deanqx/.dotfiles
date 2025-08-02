local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end, { desc = 'Harpoon: Add' })
vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon: List' })

vim.keymap.set("n", "<leader>b", function() harpoon:list():select(1) end, { desc = 'Harpoon: Goto 1' })
vim.keymap.set("n", "<leader>o", function() harpoon:list():select(2) end, { desc = 'Harpoon: Goto 2' })
vim.keymap.set("n", "<leader>m", function() harpoon:list():select(3) end, { desc = 'Harpoon: Goto 3' })
vim.keymap.set("n", "<leader>i", function() harpoon:list():select(4) end, { desc = 'Harpoon: Goto 4' })
