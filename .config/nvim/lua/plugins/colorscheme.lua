return {
  -- the colorscheme should be available when starting Neovim
  "AlexvZyl/nordic.nvim",
  branch = "main",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").setup({
      italic_comments = true,
      bold_keywords = true,
      reduce_blue = true,
      swap_backgrounds = false,
    })
    require("nordic").load()
  end,
}
