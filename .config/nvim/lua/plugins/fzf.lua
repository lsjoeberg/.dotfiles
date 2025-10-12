return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- dependencies = { "nvim-mini/mini.icons" },
    opts = {},
    keys = {
        { "<leader><leader>", function() require('fzf-lua').buffers() end, desc = "Find in open buffers" },
        { "<leader>/", function() require('fzf-lua').lgrep_curbuf() end, desc = "Live grep the current buffer" },
        { "<leader>fo", function() require('fzf-lua').oldfiles() end, desc = "Find old files" },
        { "<leader>fb", function() require('fzf-lua').builtin() end, desc = "Find builtin fzf" },
        { "<leader>fh", function() require('fzf-lua').helptags() end, desc = "Find help" },
        { "<leader>fk", function() require('fzf-lua').keymaps() end, desc = "Find keymaps" },
        { "<leader>ff", function() require('fzf-lua').files() end, desc = "Find files in cwd" },
        { "<leader>fg", function() require('fzf-lua').live_grep() end, desc = "Live grep cwd" },
        { "<leader>fw", function() require('fzf-lua').grep_cword() end, desc = "Find current word" },
        { "<leader>fW", function() require('fzf-lua').grep_cWORD() end, desc = "Find current WORD" },
        { "<leader>fr", function() require('fzf-lua').resume() end, desc = "Find resume" },
        {
            "<leader>fc",
            function() require('fzf-lua').files({cwd=vim.fn.stdpath("config")}) end,
            desc = "Find files in neovim config",
        },
    }
}
