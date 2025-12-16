return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    -- 1. Setup Mason
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    -- 2. Setup Mason-LSPConfig
    require("mason-lspconfig").setup({
      ensure_installed = { 
        "lua_ls",
        "rust_analyzer", 
        "gopls",
      },
      automatic_installation = true,
      
      -- 3. HANDLERS (The new way)
      -- Instead of manually calling .setup(), we let Mason handle it.
      handlers = {
        -- The "Default" Handler
        -- This runs for every server installed by Mason EXCEPT the ones with specific keys below.
        function(server_name)
          -- IMPORTANT: Explicitly ignore Rust and Go here.
          -- We want 'rustaceanvim' and 'go.nvim' to handle these, not lspconfig.
          if server_name == "rust_analyzer" or server_name == "gopls" then
            return
          end

          local capabilities = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        -- Specific Handler for Lua
        ["lua_ls"] = function()
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      }
    })
  end
}
