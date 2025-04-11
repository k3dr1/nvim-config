-- Remaps
-- from what I understand, using vim.keymap.set()
-- is preferred over other methods

-- Unmapping Space
vim.keymap.set("n", "<SPACE>", "<Nop>", { noremap = true, silent = true })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Removing that annoying <C-l> keymap in netrw
vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function(ev)
        if ev["file"] == "netrw" then
            vim.api.nvim_buf_set_keymap(0, "n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, "n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, "n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
        end
    end
})

-- Remapping the Esc to Exit terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Open Netrw/Neotree/Oil with SPC+e
vim.keymap.set("n", "<leader>e", "<cmd>Oil %/..<CR>", { noremap = true, silent = true, desc = "Open Oil" })

-- Go to config, if you wanna go back you can execute ":cd -"
vim.keymap.set("n", "<leader>cn", "<cmd>Oil " .. vim.fn.stdpath("config") .. "<CR>",
    { noremap = true, silent = true, desc = "Go to config" })

-- Lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Lsp Actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
    end
})

-- Always match cwd with the oil buffer
vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Set cwd to follow directory shown in oil buffers.",
    group = vim.api.nvim_create_augroup("OilAutoCwd", {}),
    pattern = "oil:///*",
    callback = function()
        if vim.bo.filetype == "oil" then
            vim.cmd.lcd(require("oil").get_current_dir())
        end
    end,
})

-- Debugger keymaps (tbd)
local dap = require("dap")
vim.keymap.set("n", "<leader>dk", function() dap.continue() end, { desc = "DAP continue" })
vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "DAP Run last" })
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end, { desc = "DAP Toggle breakpoint" })

-- Trouble keymaps
vim.keymap.set("n", "<leader>T", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)", })
vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)", })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)", })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)", })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)", })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)", })

-- Fzf-lua keymaps
vim.keymap.set("n", "<leader>fl", "<cmd>FzfLua<cr>", { desc = "Open FzfLua", })
vim.keymap.set("n", "<space>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Fzflua live grep", })
vim.keymap.set("n", "<space>ff", "<cmd>FzfLua files<cr>", { desc = "Fzflua files", })
vim.keymap.set("n", "<space>fb", "<cmd>FzfLua buffers<cr>", { desc = "Fzflua buffers", })

-- Changing the font in neovide
-- if vim.g.neovide then
--     vim.keymap.set("n", "<C-=>", function()
--         local num = tonumber(string.match(vim.o.guifont, "([%d%.]+)$"))
--         vim.o.guifont = string.gsub(vim.o.guifont, "([%d%.]+)$", tostring(num + 0.05))
--     end, { desc = "Increase font size", })
--     vim.keymap.set("n", "<C-->", function()
--         local num = tonumber(string.match(vim.o.guifont, "([%d%.]+)$"))
--         vim.o.guifont = string.gsub(vim.o.guifont, "([%d%.]+)$", tostring(num - 0.05))
--     end, { desc = "Decrease font size", })
-- end
