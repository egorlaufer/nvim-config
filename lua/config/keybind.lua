-- [nfnl] Compiled from fnl/config/keybind.fnl by https://github.com/Olical/nfnl, do not edit.
local util = require("config.util")
util["set-normal"]("<leader>gn", ":Git switch -c ", {desc = "new branch", silent = false})
util["set-normal"]("<leader>lls", ":lua vim.lsp.codelens.run()<CR>", {desc = "codelens: run"})
util["set-normal"]("<leader>llr", ":lua vim.lsp.codelens.refresh()<CR>", {desc = "codelens: refresh"})
util["set-terminal"]("<Esc>", "<C-\\><C-n>", {desc = "term escape"})
return {}
