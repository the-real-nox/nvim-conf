return {
	{
		'hrsh7th/nvim-cmp',
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'windwp/nvim-ts-autotag',
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets'
	},
	{
		'L3MON4D3/LuaSnip',
		config = function()
		  require("luasnip.loaders.from_vscode").lazy_load()
		end,
	}
}