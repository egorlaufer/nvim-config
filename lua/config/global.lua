-- [nfnl] Compiled from fnl/config/global.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.signcolumn = "no"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.updatetime = 500
vim.o.timeoutlen = 500
vim.o.sessionoptions = "blank,curdir,folds,help,tabpages,winsize"
vim.o.inccommand = "split"
vim.o.foldlevel = 99
vim.o.hidden = true
vim.o.textwidth = 80
vim.cmd("set colorcolumn=80")
vim.cmd("set spell")
vim.cmd("set list")
vim.cmd("set wrap")
vim.cmd("set nomodeline")
vim.cmd("set guifont=Iosevka\\ Nerd\\ Font\\ Mono:h14")
vim.cmd("set splitright")
local function _1_()
  return pcall(vim.cmd, "NeovideFocus")
end
vim.defer_fn(_1_, 200)
return {}
