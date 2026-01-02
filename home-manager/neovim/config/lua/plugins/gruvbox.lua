require("gruvbox").setup({
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {
    SignColumn = { bg = "NONE" },
  },
})

vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
