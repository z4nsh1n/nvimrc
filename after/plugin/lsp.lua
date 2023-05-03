local lsp = require('lsp-zero')

lsp.preset({'recommended'})

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'clangd',
	'hls',
	'purescriptls',
	'tsserver',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-Space>'] = cmp.mapping.confirm({select = true}),
	--['<C-Space>'] = cmp.mapping.complete(),

})


local luasnip = {
	expand = function (args)
		require('luasnip').lsp_expand(args.body)
	end
}

lsp.set_preferences({
	sign_icons = {},
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	snippet = luasnip
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  local opts = {buffer = buffer, remap=false}
  vim.keymap.set("n", "<leader>ld", function () vim.lsp.buf.definition()end, opts)
  vim.keymap.set("n", "<leader>lk", function () vim.lsp.buf.hover()end, opts)
  vim.keymap.set("n", "]d", function () vim.diagnostic.goto_next()end, opts)
  vim.keymap.set("n", "[d", function () vim.diagnostic.goto_prev()end, opts)
  vim.keymap.set("i", "<A-f>", function() vim.lsp.buf.signature_help()end, opts)
  vim.keymap.set("n", "<A-f>", function() vim.lsp.buf.signature_help()end, opts)
  -- setup the rest
end)
--
---- When you don't have mason.nvim installed
---- You'll need to list the servers installed in your system
--lsp.setup_servers({'tsserver', 'eslint'})
--
---- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--settings = {
--        Lua = {
--            runtime = {
--                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                version = 'LuaJIT',
--                -- Setup your lua path
--                path = vim.split(package.path, ';')
--            },
--            diagnostics = {
--                -- Get the language server to recognize the `vim` global
--                globals = {'vim'}
--            },
--            workspace = {
--                -- Make the server aware of Neovim runtime files
--                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
--            }
--        }
--    }
--)
--
lsp.setup()
