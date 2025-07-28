require('telescope').setup({
	extensions = {
		aerial = {
			show_nesting = {
				['_'] = false,
				json = true,
				yaml = true,
			}
		}
	},
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'-u' -- include hidden/unignored files
		},
		mappings = {
			-- i = {
			-- 	["<C-j>"] = "move_selection_next",
			-- 	["<C-k>"] = "move_selection_previous",
			-- 	["j"] = "move_selection_next",
			-- 	["k"] = "move_selection_previous",
			-- },
			-- n = {
			-- 	["j"] = "move_selection_next",
			-- 	["k"] = "move_selection_previous",
			-- },
		},
	}
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Tab>', builtin.oldfiles)
vim.keymap.set('n', 'gr', builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', '<CMD>Telescope find_files<CR>')
vim.keymap.set('n', '<C-u>', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<C-]>', builtin.lsp_definitions, { noremap = true, silent = true })
