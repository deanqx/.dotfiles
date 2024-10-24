local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>h", mark.add_file)
vim.keymap.set("n", "<leader>l", ui.toggle_quick_menu)

vim.keymap.set("n", "gh", function() ui.nav_file(1) end)
vim.keymap.set("n", "gj", function() ui.nav_file(2) end)
vim.keymap.set("n", "gk", function() ui.nav_file(3) end)
vim.keymap.set("n", "gl", function() ui.nav_file(4) end)
