local languages = {
  "bash",
  "c",
  "lua",
  "markdown",
  -- Go
  "go",
  "gomod",
  "gowork",
  "gosum",
  "gotmpl",
  -- Rust
  "rust",
  "toml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module 'treesitter-modules'
    ---@type ts.mod.UserConfig
    opts = {
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = languages,
      -- Automatically install missing parsers when entering buffer (requires `tree-sitter` CLI installed)
      auto_install = true,

      highlight = {
        enable = true,
      },
      ident = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
          scope_incremental = false,
          node_decremental = "<Backspace>",
        },
      },
    },
  },
}
