require("mason").setup()
require("mason-lspconfig").setup()
require("neodev").setup()
local installed_servers = require("mason-lspconfig").get_installed_servers()
local lspconfig = require("lspconfig")

-- Setup each server dynamically
for _, server in ipairs(installed_servers) do
    if server == "lua_ls" then
        -- Custom setup for Lua
        lspconfig.lua_ls.setup({
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
        })
    elseif server == "clangd" then
        lspconfig.clangd.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            cmd = { "clangd", "--fallback-style=webkit" }
        })
    elseif server == "hls" then
        lspconfig.hls.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
                haskell = {
                    plugin = {
                        rename = {
                            config = {
                                crossModule = true
                            }
                        }
                    }
                }
            }
        })
    else
        -- Default setup for all other servers
        lspconfig[server].setup { capabilities = require("cmp_nvim_lsp").default_capabilities() }
    end
end
