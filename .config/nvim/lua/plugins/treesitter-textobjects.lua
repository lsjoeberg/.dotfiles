return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    -- TODO: Rust patterns
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
        },
        swap_previous = {
          ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter-textobjects").setup(opts)
  end,
}
