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

-- nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
vim.cmd([[
nnoremap gR :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gc        <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gR        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> [x        <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]x        <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> ]s        <cmd>lua vim.diagnostic.show()<CR>
nnoremap <silent> <leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>p <cmd>lua vim.lsp.buf.format()<CR>
]])


-- lsp-endhints (unchanged)
require("lsp-endhints").setup {
	icons = { type = "", parameter = "", offspec = "", unknown = "" },
	label = { truncateAtChars = 20, padding = 1, marginLeft = 0, sameKindSeparator = ", " },
	extmark = { priority = 50 },
	autoEnableHints = true,
}

-- Capabilities
local caps = vim.lsp.protocol.make_client_capabilities()
caps.textDocument.completion.completionItem.insertTextMode = 2

-- ======================
-- RUST: switch to rustaceanvim (rust-tools is deprecated)
-- ======================
-- Add the plugin 'mrcjkb/rustaceanvim' then configure:
vim.g.rustaceanvim = {
	tools = {
		-- roughly analogous toggles (rustaceanvim handles hints itself)
		hover_actions = { auto_focus = false },
	},
	server = {
		capabilities = caps,
		settings = {
			["rust-analyzer"] = {
				sematicHighliting = { enabled = false }, -- keeping your original key (typo preserved)
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = { allFeatures = true, targetDir = "target/ra" },
				checkOnSave = { enable = true, invocationStrategy = "once" },
				completion = {
					autoimport = { enable = true },
					callable = { snippets = "none" },
				},
			},
		},
	},
}

-- ======================
-- Other language servers via the new API
-- ======================

-- Go (gopls)
vim.lsp.config('gopls', {
	cmd = { 'gopls' },
	settings = {
		gopls = {
			analyses = {
				nilness = true, unusedparams = true, unusedwrite = true, useany = true,
			},
			experimentalPostfixCompletions = true,
			gofumpt = true,
			staticcheck = true,
			usePlaceholders = true,
		},
	},
	on_attach = _G.on_attach, -- keep if you define on_attach somewhere
})
vim.lsp.enable('gopls')

-- Python
vim.lsp.config('pylsp', {})
vim.lsp.enable('pylsp')

-- TypeScript
vim.lsp.config('tsserver', {}) -- In 0.11+ the built-in name is often 'tsserver' or 'ts_ls' depending on distro.
vim.lsp.enable('tsserver')

-- Lua
vim.lsp.config('lua_ls', {})
vim.lsp.enable('lua_ls')

-- C/C++
vim.lsp.config('clangd', {})
vim.lsp.enable('clangd')

-- Solidity
vim.lsp.config('solidity_ls_nomicfoundation', {}) -- or 'solidity' depending on your server binary
vim.lsp.enable('solidity_ls_nomicfoundation')

-- Bash
vim.lsp.config('bashls', {})
vim.lsp.enable('bashls')

-- CSS (needs snippetSupport)
local css_caps = vim.tbl_deep_extend('force', {}, caps, {
	textDocument = { completion = { completionItem = { snippetSupport = true } } }
})
vim.lsp.config('cssls', { capabilities = css_caps })
vim.lsp.enable('cssls')

-- Docker
vim.lsp.config('dockerls', {})
vim.lsp.enable('dockerls')

-- YAML
vim.lsp.config('yamlls', {
	settings = {
		yaml = {
			format = { enable = true },
			schemas = { kubernetes = { "*.yaml", "*.yml" } },
		},
	},
})
vim.lsp.enable('yamlls')

-- HTML (snippet support)
local html_caps = vim.tbl_deep_extend('force', {}, caps, {
	textDocument = { completion = { completionItem = { snippetSupport = true } } }
})
vim.lsp.config('html', { capabilities = html_caps })
vim.lsp.enable('html')

-- HTMX
vim.lsp.config('htmx', {})
vim.lsp.enable('htmx')

-- Zig
vim.lsp.config('zls', {})
vim.lsp.enable('zls')
