-- require('fine-cmdline').setup({
-- 	cmdline = {
-- 		enable_keymaps = true,
-- 		smart_history = true,
-- 		prompt = ': '
-- 	},
-- 	popup = {
-- 		position = {
-- 			row = '98%',
-- 			col = '50%',
-- 		},
-- 		size = {
-- 			width = '70%',
-- 		},
-- 		border = {
-- 			style = 'rounded',
-- 		},
-- 		win_options = {
-- 			winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
-- 		},
-- 	},
-- 	hooks = {
-- 		before_mount = function(input)
-- 			-- code
-- 		end,
-- 		after_mount = function(input)
-- 			-- code
-- 		end,
-- 		set_keymaps = function(imap, feedkeys)
-- 			-- code
-- 		end
-- 	}
-- })
--
-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
--
-- `/` cmdline setup.
local cmp = require("cmp")
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})
