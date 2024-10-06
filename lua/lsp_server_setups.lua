require("mason").setup()
require("mason-lspconfig").setup()

local installed_servers = require("mason-lspconfig").get_installed_servers()

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
                globals = { "vim" }
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

-- Setup each server dynamically
for _, server in ipairs(installed_servers) do
    if server == "lua_ls" then
        -- Custom setup for Lua
        lspconfig.lua_ls.setup(lua_ls_setup)
    elseif server == "clangd" then
        lspconfig.clangd.setup { capabilities = capabilities,
            cmd = { "clangd", "--fallback-style=webkit" }
        }
    else
        -- Default setup for all other servers
        lspconfig[server].setup { capabilities = capabilities }
    end
end
