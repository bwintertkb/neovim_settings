local dap = require('dap')

-- LLDB adapter configuration
dap.adapters.lldb = {
	type = 'executable',
	command = '/home/bwintertkb/.local/share/nvim/mason/bin/codelldb',
	name = 'lldb'
}

-- GDB adapter configuration
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" }
}

-- Python adapter configuration
dap.adapters.python = {
	type = 'executable',
	command = '/usr/bin/python3',
	args = { '-m', 'debugpy.adapter' },
}

-- Rust debugging configuration
dap.configurations.rust = {
	{
		type = 'lldb',
		request = 'launch',
		name = "Debug",
		cwd = '${workspaceFolder}',
		program = function()
			local cwd = vim.fn.getcwd()
			local build_output = vim.fn.system("cargo build")
			if vim.v.shell_error ~= 0 then
				error("cargo build failed:\n" .. build_output)
			end
			local project_name = string.match(cwd, "([^/]+)$")
			return cwd .. '/target/debug/' .. project_name
		end,
		stopOnEntry = false,
		args = {},
		initCommands = function()
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
	}
}

-- Python debugging configuration
dap.configurations.python = {
	{
		type = 'python',
		request = 'launch',
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			local venv_path = os.getenv("VIRTUAL_ENV")
			if venv_path then
				return venv_path .. '/bin/python'
			else
				return '/usr/bin/python3'
			end
		end,
	},
}

-- ✅ Load dapui safely and configure
local dapui_status, dapui = pcall(require, "dapui")
if dapui_status then
	dapui.setup() -- You can pass a custom layout here if needed

	-- Automatically open dapui when debugging starts
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	-- Uncomment if you want UI to auto-close when debug ends
	-- dap.listeners.before.event_terminated["dapui_config"] = function()
	--   dapui.close()
	-- end
	-- dap.listeners.before.event_exited["dapui_config"] = function()
	--   dapui.close()
	-- end
end

-- Keybindings
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

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>bp', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
map('n', '<F1>', '<cmd>lua require("dapui").toggle()<CR>', opts)

-- Virtual text setup
require("nvim-dap-virtual-text").setup()
