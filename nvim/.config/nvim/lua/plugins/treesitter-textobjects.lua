return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local function map_select(lhs, query, desc)
      vim.keymap.set({ "x", "o" }, lhs, function()
        select.select_textobject(query, "textobjects")
      end, { desc = desc })
    end

    map_select("af", "@function.outer", "Function")
    map_select("if", "@function.inner", "Inner function")
    map_select("ac", "@class.outer", "Class")
    map_select("ic", "@class.inner", "Inner class")

    local swap = require("nvim-treesitter-textobjects.swap")
    vim.keymap.set("n", "<leader>a", function()
      swap.swap_next("@parameter.inner")
    end, { desc = "Swap with next parameter" })
    vim.keymap.set("n", "<leader>A", function()
      swap.swap_previous("@parameter.inner")
    end, { desc = "Swap with previous parameter" })
  end,
}
