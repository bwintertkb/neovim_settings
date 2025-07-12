require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- require("mason-lspconfig").setup({
--   -- Enable automatic installation of servers managed by mason-lspconfig:
--   automatic_installation = false,
-- })

vim.cmd([[
nnoremap gR :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gc        <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> [x        <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]x        <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> ]s        <cmd>lua vim.diagnostic.show()<CR>
nnoremap <silent> <leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>p <cmd>lua vim.lsp.buf.format()<CR>
]])

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Tell the server that we support adjusted text edits.
capabilities.textDocument.completion.completionItem.insertTextMode = 2

-- pyright
require("lspconfig").pyright.setup({})

--rust
local opts = {
	-- rust-tools options
	tools = {
		hover_with_actions = false,
		executor = require("rust-tools/executors").quickfix, -- can be quickfix or termopen
		reload_workspace_from_cargo_toml = true,
		inlay_hints = {
			auto                   = true,
			only_current_line      = false,
			show_parameter_hints   = true,
			parameter_hints_prefix = "<-",
			other_hints_prefix     = "=>",
			max_len_align          = false,
			max_len_align_padding  = 1,
			right_align            = false,
			right_align_padding    = 7,
			highlight              = "Comment",
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
	-- https://rust-analyzer.github.io/manual.html#features
	server = {
		settings = {
			["rust-analyzer"] = {
				-- inlayHints = {
				-- 	typeHints         = { enable = false }, -- ← turn off `let x: Type = ...` hints
				-- 	parameterHints    = { enable = true }, -- keep parameter name hints
				-- 	chainingHints     = { enable = true }, -- keep method‐chain result type hints
				-- 	closingBraceHints = { enable = true }, -- keep “} // impl Foo” hints
				-- 	-- you can leave all the rest at their defaults:
				-- 	-- bindingModeHints, closureReturnTypeHints, lifetimeElisionHints, etc.
				-- },
				sematicHighliting = {
					enabled = false,
				},
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = {
					allFeatures = false,
					targetDir = "target/ra"
				},
				checkOnSave = {
					-- enable = false
					enable = true,
					invocationStrategy = "once"
					-- default: `cargo check`
					-- command = "clippy",
					-- command = "cargo check",
				},
				completion = {
					autoimport = {
						enable = true,
					},
					callable = {
						snippets = "none"
					}
				}
			},

		},
	},
}
require("rust-tools").setup(opts)
--
--Go
require("lspconfig").gopls.setup({
	cmd = { "gopls" },
	settings = {
		gopls = {
			analyses = {
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			experimentalPostfixCompletions = true,
			gofumpt = true,
			staticcheck = true,
			usePlaceholders = true,
		},
	},
	on_attach = on_attach,
})

-- Typescript
require("lspconfig").ts_ls.setup({})

-- Lua
require("lspconfig").lua_ls.setup({})

-- C/C++
require("lspconfig").clangd.setup({})

-- Solidity
require("lspconfig").solidity.setup({})

-- Bash
require("lspconfig").bashls.setup({})

-- CSS
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})

-- Docker
require("lspconfig").dockerls.setup({})

-- ASM
-- require("lspconfig").asm_lsp.setup({})

-- YAML
require("lspconfig")["yamlls"].setup({
	settings = {
		yaml = {
			format = {
				enable = true,
			},
			schemas = { kubernetes = { "*.yaml", "*.yml" } }
		},
	},
})

-- HTML
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup {
	capabilities = capabilities,
}
-- HTMX
require("lspconfig").htmx.setup {}

-- Zig
require("lspconfig").zls.setup {}

-- Svelte
require("lspconfig").svelte.setup {}
