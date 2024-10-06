vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})

end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("lsp_server_setups")
require("remaps")
require("misc")

require("configurations.treesitter")
require("configurations.cmp")
require("configurations.neotree")
require("configurations.trouble")
require("configurations.dap")
require("configurations.lualine")
require("configurations.which-key")
require("configurations.autopairs")
--require("configurations.indent-blankline")

--require("configurations.presence")
