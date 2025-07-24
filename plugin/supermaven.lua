require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<Tab>",
		clear_suggestion = "<C-]>",
		accept_word = "<C-j>",
	},
	ignore_filetypes = {}, -- or { "cpp", }
	color = {
		suggestion_color = "#ffffff",
		cterm = 244,
	},
	log_level = "info",            -- set to "off" to disable logging completely
	disable_inline_completion = true, -- disables inline completion for use with cmp
	disable_keymaps = false,       -- disables built in keymaps for more manual control
	condition = function()
		return false
	end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
})

local function echo_temp(msg)
	vim.api.nvim_echo({ { msg, "None" } }, false, {})
	vim.defer_fn(function()
		vim.api.nvim_echo({ { '' } }, false, {})
	end, 2000)
end

-- Fixed: wrap the full command string
local function supermaven_start()
	vim.cmd('SupermavenStart')
	echo_temp("Supermaven enabled")
end

local function supermaven_stop()
	vim.cmd('SupermavenStop')
	echo_temp("Supermaven disabled")
end

local is_enabled = true

local function supermaven_toggle()
	is_enabled = not is_enabled
	if is_enabled then
		supermaven_start()
	else
		supermaven_stop()
	end
end

vim.keymap.set('n', '<leader>G', supermaven_toggle, { noremap = true, silent = true })
