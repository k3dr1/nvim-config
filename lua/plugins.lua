return {
    -- MASON
    { "williamboman/mason.nvim",          init = function() require("mason").setup() end },

    -- TREESITTER
    { "nvim-treesitter/nvim-treesitter" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason-lspconfig.nvim" },

    -- UTILITIES
    { "nvim-telescope/telescope.nvim",    branch = "0.1.x",                              dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-neo-tree/neo-tree.nvim",      branch = "v3.x",                               dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", } },
    { "mfussenegger/nvim-dap" },
    --{"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},
    { "mbbill/undotree" },
    --{"andweeb/presence.nvim"},
    { "folke/neodev.nvim" },

    -- WHICH-KEY
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 700
        end,
    },
    { 'echasnovski/mini.icons',  version = false },

    -- Code completion & general coding
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "windwp/nvim-autopairs",   event = "InsertEnter", opts = {} },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>t",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    -- FUNNY
    { "akinsho/bufferline.nvim",    version = "*",                                   dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "nvim-lualine/lualine.nvim",  dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "sbdchd/neoformat" },

    -- NOTETAKING
    --{ "nvim-orgmode/orgmode",
    --  event = "VeryLazy",
    --  ft = { "org" },
    --  config = function()
    --          -- Setup orgmode
    --          require("orgmode").setup({
    --                  org_agenda_files = "~/orgfiles/**/*",
    --                  org_default_notes_file = "~/orgfiles/refile.org",
    --          })
    --  end,
    --},

    -- COLORSCHEMES
    { "projekt0n/github-nvim-theme" },
    { "killitar/obscure.nvim" },
    { "slugbyte/lackluster.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "Mofiqul/vscode.nvim" },
    { "Shatur/neovim-ayu" },
    { "kvrohit/rasmus.nvim" },
    { "morhetz/gruvbox" },
    { "luisiacc/gruvbox-baby" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/edge" },
}
