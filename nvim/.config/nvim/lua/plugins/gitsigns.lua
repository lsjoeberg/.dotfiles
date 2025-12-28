return {
  "lewis6991/gitsigns.nvim",
  opts = {},
  config = true,
  lazy = false,
  -- stylua: ignore
  keys = {
    { "<leader>h<Enter>", function() require("gitsigns").select_hunk() end, desc = "Select current hunk" },
    { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
    { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
    { mode = { "v" }, "<leader>hs", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Stage line" },
    { mode = { "v" }, "<leader>hr", function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Reset line" },
    { "<leader>hS", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
    { "<leader>hR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
    { "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
    { "<leader>hi", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview hunk inline" },
    { "<leader>hb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame line" },
    { "<leader>hd", function() require("gitsigns").diffthis() end, desc = "Diff this against HEAD" },
    { "<leader>tb", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toogle current line blame" },
    { "<leader>tw", function() require("gitsigns").toggle_word_diff() end, desc = "Toggle word diff" },
    { mode = { "o", "x" }, "<leader>ih", function() require("gitsigns").select_hunk() end, desc = "Select hunk" },
  },
}
