return require('packer').startup(function(use)
	-- Packer can handle itself
	use 'wbthomason/packer.nvim'
	-- colorschemes
	use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter' })
	use 'olimorris/onedarkpro.nvim'
	-- vim-airline
	use 'vim-airline/vim-airline'
	-- dev-icons
	use 'ryanoasis/vim-devicons'

	use 'airblade/vim-gitgutter'
	-- Tagbar for code navigation
	use 'preservim/tagbar'
	-- For commenting gcc & gc
	use 'terrortylor/nvim-comment'
	-- File search
	-- use 'kien/ctrlp.vim'
	-- Rust lang
	use 'rust-lang/rust.vim'
	-- Go lang
	use 'ray-x/go.nvim'
	-- Aerial function finder
	use 'stevearc/aerial.nvim'
	-- Fuzzy finder
	use 'junegunn/fzf'

	use 'folke/trouble.nvim'
	-- LSP
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/nvim-cmp'
	-- use 'noib3/nvim-completion'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	-- Tabnine
	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
	--LSPKind
	use 'onsails/lspkind.nvim'

	use 'j-hui/fidget.nvim'
	use 'kosayoda/nvim-lightbulb'
	use 'm-demare/hlargs.nvim'
	use 'neovim/nvim-lspconfig'
	use 'simrat39/rust-tools.nvim'
	use 'weilbith/nvim-code-action-menu'
	use 'williamboman/nvim-lsp-installer'
	use 'kyazdani42/nvim-web-devicons'
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
		end}
	use 'nvim-lua/plenary.nvim'
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0'}
	use 'natebosch/vim-lsc'
	use 'mg979/vim-visual-multi'
	use 'dyng/ctrlsf.vim'
	use 'jiangmiao/auto-pairs' 
	use 'MunifTanjim/nui.nvim'
	use 'nvim-neo-tree/neo-tree.nvim'
	use 'leafgarland/typescript-vim'
	use 'ianks/vim-tsx'
	use 'jose-elias-alvarez/typescript.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'rafamadriz/neon'
	-- line highlight
	use 'miyakogi/conoline.vim'
	-- python autoformatter
	use 'smbl64/vim-black-macchiato'
end)
