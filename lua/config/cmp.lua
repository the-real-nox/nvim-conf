require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 'lua_ls', 'pyright', 'html', 'yamlls' }
}
local cmp = require('cmp')
local lspconfig = require('lspconfig')
local luasnip = require('luasnip')

cmp.setup({
	snippet = {
		  -- REQUIRED - you must specify a snippet engine
		  expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		  end,
		},
		window = {
			completion = cmp.config.window.bordered(),
		  -- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<Tab>'] = cmp.mapping.confirm({ select = true }),
			['<Up>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { 'i', 's' }),
			['<Down>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping.close()
		}),
		sources = cmp.config.sources({
		  { name = 'luasnip' }, -- For luasnip users.
		  { name = 'nvim_lsp', max_item_count = 10 } -- lsp-completion
		  -- { name = 'ultisnips' }, -- For ultisnips users.
		  -- { name = 'snippy' }, -- For snippy users.
		},
		{
		  { name = 'buffer' },
		})
})

require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = true
    }
  }
})

capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.pyright.setup {
  capabilities = capabilities
}

lspconfig.lua_ls.setup {
    capabilities = capabilities
}

lspconfig.html.setup{
	capabilities = capabilities,
	opts = {
	settings = {
		html = {
		  format = {
			templating = true,
			wrapLineLength = 120,
			wrapAttributes = 'auto',
		  },
		  hover = {
			documentation = true,
			references = true,
		  },
		},
	  },
	}
}
