-- Remaps
-- from what I understand, using vim.keymap.set()
-- is preferred over other methods

-- Unmapping Space
vim.keymap.set('n', '<SPACE>', '<Nop>', { noremap = true, silent = true })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Removing that annoying <C-l> keymap in netrw
vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function(ev)
        if ev["file"] == "netrw" then
            vim.api.nvim_buf_set_keymap(0, 'n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, 'n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, 'n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
            vim.api.nvim_buf_set_keymap(0, 'n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
        end
    end
})

-- Remapping the Esc to Exit terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Open Neotree with SPC+e
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neotree" })

-- Go to config, if you wanna go back you can execute ":cd -"
vim.keymap.set("n", "<leader>cn", "<cmd>cd " .. vim.fn.stdpath("config") .. "<CR>",
    { noremap = true, silent = true, desc = "Go to config" })

-- Lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Lsp Actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    end
})

-- Debugger keymaps
local dap = require('dap')
vim.keymap.set('n', '<leader>dk', function() dap.continue() end, { desc = "DAP continue" })
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end, { desc = "DAP Run last" })
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, { desc = "DAP Toggle breakpoint" })

-- Telescope keymaps
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = "Telescope help tags" })
