-- Setup lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

-- Global mappings
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)

local on_attach = function(_, bufnr)

	-- Create a function that lets us more easily define mappings specific for
	-- LSP-related itmes. It sets the mode, buffer and description for us.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("gr", require("telescope.builtin").lspreferences, "[G]oto [R]eferences")
	nmap("K", vim.lsp.buf.hover(), "Show documentation")
end


lspconfig.pyright.setup {
	capabilities = capabilities,
	on_attach    = on_attach,
}
lspconfig.clangd.setup {
	capabilities = capabilities,
	on_attach    = on_attach,
}
lspconfig.lua_ls.setup {
	capabilities = capabilities,
	on_attach    = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = {'vim'}, }, -- suppress warning
			runtime     = { version = 'LuaJIT' },
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		  -- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false, },
		},
	}
}
lspconfig.rust_analyzer.setup {}
lspconfig.julials.setup {
	capabilities = capabilities,
	on_attach    = on_attach,
	on_new_config = function(new_config, _)
        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
        if require'lspconfig'.util.path.is_file(julia) then
	    --vim.notify("Hello!")
            new_config.cmd[1] = julia
        end
    end
}
lspconfig.typst_lsp.setup {  -- For typst_lsp to work, initialize git repo 
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		exportPdf = "onType",
	}
}
lspconfig.texlab.setup{}

vim.opt.completeopt = {"menu", "menuone", "noselect"}

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}


cmp.setup({
	snippet = {
	-- REQUIRED -- you must specify a snippet engine
	expand = function(args)
		require("luasnip").lsp_expand(args.body)
	end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"]     = cmp.mapping.scroll_docs(-4),
		["<C-f>"]     = cmp.mapping.scroll_docs(4),
		["<C-p>"]     = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"]     = cmp.mapping.select_next_item(cmp_select),
		["<C-s>"]     = cmp.mapping.complete(),
		["<C-e>"]     = cmp.mapping.abort(),
		["<CR>"]      = cmp.mapping.confirm({ select = false }), -- let's see what happens
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip"  }
	}, {
		{ name = "buffer" },
	})
})


