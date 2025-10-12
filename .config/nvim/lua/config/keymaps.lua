local km = vim.keymap

-- Save
km.set("n", "<leader>w", "<CMD>update<CR>", { desc = "Write buffer if it has been modified"} )

-- Quit
km.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Quit"} )
km.set("n", "<leader>d", "<CMD>bd<CR>", { desc = "Close current buffer"} )

-- Diagnostics
km.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Open diagnostics in float" })
