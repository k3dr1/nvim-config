require("mason").setup()
require("mason-lspconfig").setup()

require("neodev").setup({})

local lspconfig = require("lspconfig")

local lua_ls_setup = {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
			},
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {"vim"}
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		}
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup(lua_ls_setup)
lspconfig.asm_lsp.setup{capabilities = capabilities}
lspconfig.shfmt.setup{capabilities = capabilities}
lspconfig.bashls.setup{capabilities = capabilities}
lspconfig.clangd.setup{capabilities = capabilities}
lspconfig.pyright.setup{capabilities = capabilities}
lspconfig.cmake.setup{capabilities = capabilities}
lspconfig.yamlls.setup{capabilities = capabilities}
lspconfig.lemminx.setup{capabilities = capabilities}
lspconfig.html.setup{capabilities = capabilities}
lspconfig.cssls.setup{capabilities = capabilities}
lspconfig.jsonls.setup{capabilities = capabilities}
lspconfig.texlab.setup{capabilities = capabilities}
