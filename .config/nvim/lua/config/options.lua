-- GENERAL --------------------------------------------------------------------
vim.o.mouse = 'a'           -- enable mouse mode
vim.o.undofile = true       -- store undos between sessions
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- UI -------------------------------------------------------------------------
vim.o.relativenumber = true -- show relative line number
vim.o.cursorline = true     -- highlight current line
vim.o.showmode = false      -- let statusline handle showing mode
vim.o.signcolumn = "yes"    -- always show signcolumn; avoid horizontal shifts

-- Whitespace
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", extends = "›", precedes = "‹", nbsp = "␣" }

-- Nav
vim.o.splitright = true     -- open new split to the right (not left)
vim.o.splitbelow = true
vim.o.scrolloff = 8         -- scroll when 8 lines away from margin

-- INDENTATION ----------------------------------------------------------------
vim.o.expandtab = true      -- convert tabs to spaces
vim.o.tabstop = 4           -- visual spaces per tab
vim.o.shiftwidth = 4        -- number of spaces per step of autoindent
vim.o.softtabstop = 4       -- number of spaces in tab when editing
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true    -- visually indent wrapped lines

-- SEARCH ---------------------------------------------------------------------
vim.o.ignorecase = true     -- ignore case when searching
vim.o.smartcase = true      -- ... unless we start with capital letter

-- TODO: .vimrc; categorise (or not)
