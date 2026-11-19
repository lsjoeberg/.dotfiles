local servers = {
  "gopls",
  "lua_ls",
  "basedpyright",
  "bashls",
  "zls",
  "terraformls",
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = true })

    -- One detach handler for every buffer. Creating the augroup inside
    -- LspAttach with clear=true dropped the handler for the previous buffer.
    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
      callback = function(event)
        if not vim.api.nvim_buf_is_valid(event.buf) then
          return
        end
        for _, remaining in ipairs(vim.lsp.get_clients({ bufnr = event.buf })) do
          if remaining:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            return
          end
        end
        vim.api.nvim_buf_call(event.buf, vim.lsp.buf.clear_references)
        vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = event.buf })
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
        end

        -- fzf-lua instead of the quickfix defaults.
        map("grr", function()
          require("fzf-lua").lsp_references()
        end, "References")
        map("gri", function()
          require("fzf-lua").lsp_implementations()
        end, "Implementations")
        map("grd", function()
          require("fzf-lua").lsp_definitions()
        end, "Definitions")
        map("grD", vim.lsp.buf.declaration, "Declaration")
        map("gO", function()
          require("fzf-lua").lsp_document_symbols()
        end, "Document symbols")
        map("gW", function()
          require("fzf-lua").lsp_live_workspace_symbols()
        end, "Workspace symbols")
        map("grt", function()
          require("fzf-lua").lsp_typedefs()
        end, "Type definition")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = event.buf })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_group,
            callback = vim.lsp.buf.clear_references,
          })
        end

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "Toggle inlay hints")
        end
      end,
    })

    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      } or {},
      virtual_text = {
        source = "if_many",
        spacing = 2,
      },
    })

    -- nvim-lspconfig supplies cmd/filetypes/root detection. These calls only override.
    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })

    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
          semanticTokens = true,
        },
      },
    })

    vim.lsp.config("lua_ls", {
      -- before_init mutates the settings table that didChangeConfiguration sends.
      -- on_init runs after that notification, so it would not reach the server.
      before_init = function(_, config)
        local root = config.root_dir
        if
          root
          and root ~= vim.fn.stdpath("config")
          and (vim.uv.fs_stat(root .. "/.luarc.json") or vim.uv.fs_stat(root .. "/.luarc.jsonc"))
        then
          return
        end

        config.settings = config.settings or {}
        config.settings.Lua = vim.tbl_deep_extend("force", config.settings.Lua or {}, {
          runtime = {
            version = "LuaJIT",
            path = { "lua/?.lua", "lua/?/init.lua" },
          },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME },
          },
        })
      end,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = vim.list_extend(vim.deepcopy(servers), {
        "stylua",
        "gofumpt",
        "yamlfmt",
        "ruff",
      }),
    })

    -- Explicit list so a Mason-installed jdtls or rust_analyzer is not enabled
    -- beside nvim-java and rustaceanvim.
    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_enable = servers,
    })
  end,
}
