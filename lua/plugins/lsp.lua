return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    -- 1. DEFINE KEYMAPS (Runs when an LSP connects)
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = { buffer = event.buf, noremap = true, silent = true }

        -- Your requested keymaps
        vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.incoming_calls()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
        vim.keymap.set('n', 'gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
        
        -- Diagnostic jumps
        vim.keymap.set('n', '[x', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']x', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
        vim.keymap.set('n', ']s', '<cmd>lua vim.diagnostic.open_float()<cr>', opts) -- "show" is usually open_float

        -- Actions & Format
        vim.keymap.set('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<leader>p', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
      end,
    })

    -- 2. THE SILENT HIGHLANDER FIX (Keeps duplicate clients away)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "rust_analyzer" then
          local cmd = client.config.cmd or {}
          if cmd[1] == "rust-analyzer" then
             vim.schedule(function() client.stop() end)
          end
        end
      end
    })
    
    -- 3. Setup Mason
    require("mason").setup({
      ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } }
    })

    -- 4. Setup Mason-LSPConfig
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "gopls" },
      automatic_installation = true,
      handlers = {
        function(server_name)
          if server_name == "rust_analyzer" or server_name == "gopls" then return end
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
        ["lua_ls"] = function()
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = { Lua = { diagnostics = { globals = { "vim" } } } },
          })
        end,
      }
    })
  end
}
