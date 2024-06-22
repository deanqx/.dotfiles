local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>h", mark.add_file)
vim.keymap.set("n", "<leader>l", ui.toggle_quick_menu)

vim.keymap.set("n", "gy", function() ui.nav_file(1) end)
vim.keymap.set("n", "gx", function() ui.nav_file(2) end)
vim.keymap.set("n", "gc", function() ui.nav_file(3) end)
