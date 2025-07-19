return require("packer").startup(function(use)
	-- Packer can handle itself
	use("wbthomason/packer.nvim")

	-- Colorschemes
	use("bwintertkb/no-clown-fiesta.nvim")

	-- UI Enhancements
	use("vim-airline/vim-airline")
	use("bwintertkb/visual_wrap.nvim")
	use("preservim/tagbar")
	use("stevearc/aerial.nvim")
	use("folke/trouble.nvim")
	use("miyakogi/conoline.vim")
	use("jiangmiao/auto-pairs")
	use("MunifTanjim/nui.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("mg979/vim-visual-multi")
	use("dyng/ctrlsf.vim")
	use("bwintertkb/neo-tree.nvim")

	-- Syntax and Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-ts-autotag")

	-- Git
	use("f-person/git-blame.nvim")

	-- Commenting
	use("terrortylor/nvim-comment")

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
	})
	use("nvim-lua/plenary.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("simrat39/rust-tools.nvim")
	use("j-hui/fidget.nvim", { tag = "legacy" })
	use("onsails/lspkind.nvim")
	use {
		"bwintertkb/nvim-lsp-endhints",
		config = function()
			require("lsp-endhints").setup() -- required, even if empty
		end,
	}

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("hrsh7th/cmp-cmdline")

	-- TabNine
	if vim.fn.has("win32") then
		use({
			"tzachar/cmp-tabnine",
			after = "nvim-cmp",
			run = "powershell ./install.ps1",
			requires = "hrsh7th/nvim-cmp",
		})
	else
		use({
			"tzachar/cmp-tabnine",
			run = "./install.sh",
			requires = "hrsh7th/nvim-cmp",
		})
	end

	-- Copilot and AI Completion
	use("zbirenbaum/copilot.lua")
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})
	use("supermaven-inc/supermaven-nvim")

	-- Debugging
	use("nvim-neotest/nvim-nio")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	-- Language-specific Plugins
	use("rust-lang/rust.vim")
	use("ray-x/go.nvim")

	-- Terminal Integration
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
end)
