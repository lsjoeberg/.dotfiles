return {
  "lewis6991/gitsigns.nvim",
  opts = {},
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
    { "<leader>tb", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle current line blame" },
    { "<leader>tB", function()
      local tab = vim.api.nvim_get_current_tabpage()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "gitsigns-blame" then
          vim.api.nvim_win_close(win, true)
          return
        end
      end
      require("gitsigns").blame()
    end, desc = "Toggle file blame" },
    { "<leader>tw", function() require("gitsigns").toggle_word_diff() end, desc = "Toggle word diff" },
    { mode = { "o", "x" }, "<leader>ih", function() require("gitsigns").select_hunk() end, desc = "Select hunk" },
  },
}
