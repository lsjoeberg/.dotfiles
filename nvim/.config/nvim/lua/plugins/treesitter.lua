local languages = {
  "bash",
  "c",
  "lua",
  "markdown",
  "go",
  "gomod",
  "gowork",
  "gosum",
  "gotmpl",
  "rust",
  "toml",
  "java",
  "python",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Async, no-op when present. Installs parser dependencies (for example markdown_inline).
    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter.setup", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        if not vim.treesitter.language.add(lang) then
          return
        end
        vim.treesitter.start(args.buf, lang)
        -- Experimental. Returns -1 when the language has no indent query.
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- 0.12 node selection is `an` / `in`. Keep the previous keys.
    local km = vim.keymap
    km.set("n", "<Enter>", "van", { remap = true, desc = "Incrementally select node" })
    km.set("x", "<Enter>", "an", { remap = true, desc = "Expand node selection" })
    km.set("x", "<Backspace>", "in", { remap = true, desc = "Shrink node selection" })
  end,
}
