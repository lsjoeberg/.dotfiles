return {
  "DrKJeff16/project.nvim",
  lazy = false,
  opts = {
    -- When detection methods disagree, the pattern root wins. The default
    -- list treats `.stylua.toml` as a project, which splits this repo.
    patterns = { ".git" },
    fzf_lua = { enabled = true },
  },
  keys = {
    { "<leader>fp", "<cmd>Project fzf-lua<cr>", desc = "Find projects" },
  },
}
