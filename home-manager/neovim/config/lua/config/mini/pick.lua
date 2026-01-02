require("mini.pick").setup()
require("mini.extra").setup()

vim.keymap.set("n", "<leader>pb", "<CMD>Pick buffers<CR>", { desc = "Show open buffers" })
vim.keymap.set("n", "<leader>po", "<CMD>Pick files<CR>", { desc = "Files fuzzy finder" })
vim.keymap.set("n", "<leader>pf", "<CMD>Pick grep_live<CR>", { desc = "Find text" })
