-- [nfnl] Compiled from fnl/config/global.fnl by https://github.com/Olical/nfnl, do not edit.
_G.vim.g.mapleader = " "
_G.vim.g.maplocalleader = ","
_G.vim.o.signcolumn = "no"
_G.vim.g.loaded_netrw = 1
_G.vim.g.loaded_netrwPlugin = 1
_G.vim.o.softtabstop = 2
_G.vim.o.expandtab = true
_G.vim.o.shiftwidth = 2
_G.vim.o.mouse = "a"
_G.vim.o.termguicolors = true
_G.vim.o.updatetime = 500
_G.vim.o.timeoutlen = 500
_G.vim.o.sessionoptions = "blank,curdir,folds,help,tabpages,winsize"
_G.vim.o.inccommand = "split"
_G.vim.o.foldlevel = 99
_G.vim.o.hidden = true
_G.vim.o.textwidth = 80
_G.vim.cmd("set colorcolumn=80")
_G.vim.cmd("set spell")
_G.vim.cmd("set list")
_G.vim.cmd("set wrap")
_G.vim.cmd("set nomodeline")
_G.vim.cmd("set guifont=Iosevka\\ Nerd\\ Font\\ Mono:h13")
_G.vim.cmd("set splitright")
local function _1_()
  return pcall(_G.vim.cmd, "NeovideFocus")
end
_G.vim.defer_fn(_1_, 200)
return {}
