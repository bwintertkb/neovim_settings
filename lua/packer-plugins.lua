return require("packer").startup(function(use)
	-- Packer can handle itself
	use("wbthomason/packer.nvim")
	-- colorschemes
	use("bwintertkb/no-clown-fiesta.nvim")
	-- vim-airline
	use("vim-airline/vim-airline")
	-- dev-icons
	use("ryanoasis/vim-devicons")
	-- enclose navigation
	use("bwintertkb/enclose_nav.nvim")
	-- visual wrap
	use("bwintertkb/visual_wrap.nvim")

	use("airblade/vim-gitgutter")
	-- Tagbar for code navigation
	use("preservim/tagbar")
	-- For commenting gcc & gc
	use("terrortylor/nvim-comment")
	-- Rust lang
	use("rust-lang/rust.vim")
	-- Go lang
	use("ray-x/go.nvim")
	-- Aerial function finder
	use("stevearc/aerial.nvim")
	-- Fuzzy finder
	use("junegunn/fzf")
	use("bwintertkb/fzf-lua")

	use("folke/trouble.nvim")
	-- LSP installer
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	-- LSP
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/nvim-cmp")
	-- use 'noib3/nvim-completion'
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	-- Tabnine
	if vim.fn.has("win32") then
		use({
			"tzachar/cmp-tabnine",
			after = "nvim-cmp",
			run = "powershell ./install.ps1",
			requires = "hrsh7th/nvim-cmp",
		})
	else
		use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	end
	--LSPKind
	use("onsails/lspkind.nvim")
	use({ "j-hui/fidget.nvim", tag = "legacy" })
	use("kosayoda/nvim-lightbulb")
	use("m-demare/hlargs.nvim")
	use("simrat39/rust-tools.nvim")
	use("weilbith/nvim-code-action-menu")
	use("kyazdani42/nvim-web-devicons")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
	})
	use("natebosch/vim-lsc")
	use("mg979/vim-visual-multi")
	use("dyng/ctrlsf.vim")
	use("jiangmiao/auto-pairs")
	use("MunifTanjim/nui.nvim")
	use("nvim-neo-tree/neo-tree.nvim")
	use("leafgarland/typescript-vim")
	use("ianks/vim-tsx")
	use("jose-elias-alvarez/typescript.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("rafamadriz/neon")
	-- line highlight
	use("miyakogi/conoline.vim")
	-- python autoformatter
	use("smbl64/vim-black-macchiato")
	-- Github Copilot
	use("zbirenbaum/copilot.lua")
	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end
	}
	-- Surround
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	-- Formatter
	use("jose-elias-alvarez/null-ls.nvim")
	-- Autotag
	use("windwp/nvim-ts-autotag")
	-- Debugger
	use("nvim-neotest/nvim-nio")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	-- Git blame
	use("f-person/git-blame.nvim")
end
)
