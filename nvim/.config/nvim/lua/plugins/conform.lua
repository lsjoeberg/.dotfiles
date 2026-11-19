return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format()
      end,
      desc = "Format current file",
    },
  },
  opts = {
    format_on_save = {
      timeout_ms = 500, -- abort if fmt doesn't complete within timeout
      lsp_format = "fallback",
    },
    -- Applies to `<leader>cf` and `gq`. format_on_save sets its own lsp_format.
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      go = { "gofumpt" },
      yaml = { "yamlfmt" },
      python = { "ruff_format", "ruff_organize_imports" },
    },
    formatters = {
      stylua = {
        append_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      yamlfmt = {
        prepend_args = { "--formatter", "retain_line_breaks_single=true" },
      },
    },
  },
}
