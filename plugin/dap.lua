local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" }
}

dap.configurations.rust = {
	{
		type = 'lldb', -- explicitly setting the adapter type
		request = 'launch',
		name = "Debug",
		cwd = '${workspaceFolder}',
		program = function()
			-- Retrieve the current working directory
			local cwd = vim.fn.getcwd()
			-- Extract the project name from the cwd. Adjust this if your project structure is different.
			local project_name = string.match(cwd, "([^/]+)$")
			-- Set the path to the binary
			return cwd .. '/target/debug/' .. project_name
		end,
		stopOnEntry = false,
		args = {},
		initCommands = function()
			-- Find out where to look for the pretty printer Python module
			local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

			local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
			local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

			local commands = {}
			local file = io.open(commands_file, 'r')
			if file then
				for line in file:lines() do
					table.insert(commands, line)
				end
				file:close()
			end
			table.insert(commands, 1, script_import)

			return commands
		end,
		-- ...,
	}
}

require("dapui").setup()
require("dapui").close()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
vim.cmd([[
nnoremap <F2> :DapContinue<CR>
nnoremap <F3> :DapStop<CR>
nnoremap <F4> :DapRerun<CR>
nnoremap <F5> :DapTerminate<CR>
nnoremap <F6> :DapStepOver<CR>
nnoremap <F7> :DapStepInto<CR>
nnoremap <F8> :DapStepOut<CR>
nnoremap <F9> :DapStepOut<CR>
]])
-- nnoremap <leader>d :DapREPL<CR
-- nnoremap <leader>v :DapUIVariables<CR>
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle breakpoint with 'bp'
map('n', '<leader>bp', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)

-- Toggle DAP UI with F1
map('n', '<F1>', '<cmd>lua require("dapui").toggle()<CR>', opts)
