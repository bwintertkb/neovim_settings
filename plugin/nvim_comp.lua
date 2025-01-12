-- By default copilot is on, <leader>G in normal mode to toggle
_G.cmp_source_toggle = true
_G.cmp_source_first_run = true

_G.setup_cmp = function()
	local sources

	if _G.cmp_source_toggle then
		sources = {
			{ name = 'nvim_lsp',    priority = 100 },
			{ name = 'cmp_tabnine', priority = 50 },
			{ name = 'copilot',     priority = 50 },
			{ name = 'vsnip',       priority = 25 },
		}
	else
		sources = {
			{ name = 'nvim_lsp',    priority = 100 },
			{ name = 'cmp_tabnine', priority = 50 },
			{ name = 'vsnip',       priority = 25 },
		}
	end

	-- Set up nvim-cmp.
	local cmp = require 'cmp'

	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		preselect = cmp.PreselectMode.None,
		mapping = cmp.mapping.preset.insert({
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif vim.fn["vsnip#available"](1) == 1 then
					feedkey("<Plug>(vsnip-expand-or-jump)", "")
				else
					fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item()
				elseif vim.fn["vsnip#jumpable"](-1) == 1 then
					feedkey("<Plug>(vsnip-jump-prev)", "")
				end
			end, { "i", "s" }),
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources(sources, {
			{ name = 'buffer' },
		})
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})


	if _G.cmp_source_first_run then
		_G.cmp_source_first_run = false
		return
	end

	local message = _G.cmp_source_toggle and "nvim-cmp Copilot enabled" or "nvim-cmp Copilot disabled"

	vim.api.nvim_echo({{message, "Normal"}}, false, {})

	-- Clear the message after 3 seconds (3000 ms)
	vim.defer_fn(function()
	    vim.cmd("echo ''")
	end, 3000)
end

setup_cmp()


vim.api.nvim_set_keymap(
  'n',
  '<leader>G',
  ":lua _G.cmp_source_toggle = not _G.cmp_source_toggle; _G.setup_cmp()<CR>",
  { noremap = true, silent = true }
)
