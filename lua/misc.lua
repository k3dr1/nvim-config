-- Font settings
if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono NFM:h11.8"
end

vim.o.cmdheight = 1

-- Scrolloff setttings
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- Change the theme
--vim.api.nvim_command('colorscheme vscode')
--vim.api.nvim_command('colorscheme kanagawa-dragon')
vim.api.nvim_command('colorscheme gruvbox-material')

-- Setting relative line numbering
vim.api.nvim_command('set number relativenumber')
-- Ignore case
vim.api.nvim_command('set ic')
-- Setting the sign column to permanent
vim.api.nvim_command('set scl=yes')
-- Highlighting only the line number
vim.api.nvim_command('set cursorlineopt=number')

-- Tab related stuff
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.list = true
vim.opt.listchars = {
    --lead = "·",
    --nbsp = "·",
    --space = "·",
    multispace = "·",
    --lead = "",
    --eol = "",
    tab = "󰄾 ", -- , 
}

vim.api.nvim_command('hi CursorLineNr guibg=None')
vim.api.nvim_command('hi CursorLineNr guifg=#ffff00')
vim.api.nvim_command('hi LineNr guibg=None')
vim.api.nvim_command('hi SignColumn guibg=None')
vim.api.nvim_command('hi DiagnosticSignHint guibg=None')
vim.api.nvim_command('hi DiagnosticSignInfo guibg=None')
vim.api.nvim_command('hi DiagnosticSignWarn guibg=None')
vim.api.nvim_command('hi DiagnosticSignError guibg=None')

vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set noshowmode')

vim.api.nvim_command('sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=')
vim.api.nvim_command('sign define DiagnosticSignWarn  text= texthl=DiagnosticSignWarn linehl= numhl=')
vim.api.nvim_command('sign define DiagnosticSignInfo  text= texthl=DiagnosticSignInfo linehl= numhl=')
vim.api.nvim_command('sign define DiagnosticSignHint  text= texthl=DiagnosticSignHint linehl= numhl=')

vim.diagnostic.config {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    float = true,
}
