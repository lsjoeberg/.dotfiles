-- Indent with 2 spaces
vim.bo.tabstop = 2 -- visual spaces per tab
vim.bo.shiftwidth = 2 -- number of spaces per step of autoindent
vim.bo.softtabstop = 2 -- number of spaces in tab when editing

-- Conceal
vim.opt_local.conceallevel = 2

-- Folding
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldlevel = 99
