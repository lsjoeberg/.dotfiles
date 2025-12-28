return {
  "stevearc/conform.nvim",
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
      timeout_ms = 500, -- abort if fmt doesn't complete within timemout
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      default_format_opts = {
        lsp_format = "fallback",
      },
      lua = { "stylua" },
      rust = { "rustfmt", lsp_format = "fallback" },
      go = { "goimports", "gofumpt" },
    },
  },
}
