local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'clangd',
	'lua_ls',
	'pyright',
	'rust_analyzer',
	'julials'
})

--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	--['<CR>'] = cmp.mapping.confirm({ select = true }),
	--['<Tab>'] = cmp.mapping.complete(),
--})

lsp.set_preferences({
	sign_icons = { }
})

--lsp.setup_nvim_cmp({
--	mapping = cmp_mappings
--})

lsp.on_attach(function(_, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd",          function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K",           function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd",  function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>",       function() vim.lsp.buf.signature_help() end, opts)

	-- These are the best remaps ever
	vim.keymap.set("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
	vim.diagnostic.config({ virtual_text = true })
end)

-- Lua language server configs 
require('lspconfig').lua_ls.setup {

	settings = {

		Lua = {

			diagnostics = {
				globals = {'vim'}, -- suppress annoying warning
			}
		}
	}
}


--vim.diagnostic.config({
--
--	virtual_text = true,
--})

lsp.setup()

