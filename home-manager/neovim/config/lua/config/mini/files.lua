require("mini.files").setup()

vim.keymap.set("n", "<leader>pe", MiniFiles.open, { desc = "Open project files tree" })
vim.keymap.set("n", "<leader>pE", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Reveal current file" })
