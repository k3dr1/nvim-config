-- Font settings
if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono NFM:h11.8"
end

vim.o.cmdheight = 1

-- Add glsl filetypes
vim.filetype.add({
    extension = {
        ["glsl"] = "glsl",
        ["vert"] = "glsl",
        ["tesc"] = "glsl",
        ["tese"] = "glsl",
        ["frag"] = "glsl",
        ["geom"] = "glsl",
        ["comp"] = "glsl",
        ["vs"] = "glsl",
        ["fs"] = "glsl",
    },
})

-- Scrolloff setttings
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- Turn off the italics in gruvbox-material
vim.g.gruvbox_material_disable_italic_comment = true

-- Change the theme
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
    multispace = "·",
    tab = "󰄾 ",
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

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
