return {
    -- the colorscheme should be available when starting Neovim
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.nord_italic = false
        -- load colorscheme
        vim.cmd('colorscheme nord')
    end
}
