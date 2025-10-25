return {
  -- Add additional mini plugins in list
  {
    {
      "nvim-mini/mini.surround",
      version = "*",
      opts = {
        -- Remap default  bindings to start with <leader>
        mappings = {
          add = "<leader>sa", -- Add surrounding in Normal and Visual modes
          delete = "<leader>sd", -- Delete surrounding
          find = "<leader>sf", -- Find surrounding (to the right)
          find_left = "<leader>sF", -- Find surrounding (to the left)
          highlight = "<leader>sh", -- Highlight surrounding
          replace = "<leader>sr", -- Replace surrounding
        },
      },
    },
  },
}
