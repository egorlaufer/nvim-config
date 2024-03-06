-- [nfnl] Compiled from fnl/config/autocmd.fnl by https://github.com/Olical/nfnl, do not edit.
local group = vim.api.nvim_create_augroup("TermAU", {})
vim.api.nvim_create_autocmd({"FileType"}, {group = group, pattern = {"toggleterm"}, command = "setlocal nospell"})
return vim.api.nvim_create_autocmd({"TermOpen"}, {group = group, command = "setlocal nospell"})
