-- [nfnl] Compiled from fnl/config/keybind.fnl by https://github.com/Olical/nfnl, do not edit.
vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<cr>", {desc = "nvim-tree: toggle", noremap = true, silent = true, nowait = true})
return vim.keymap.set("n", "<leader>fg", ":Telescope git_files<cr>", {desc = "Telescope: git files", noremap = true, silent = true, nowait = true})
