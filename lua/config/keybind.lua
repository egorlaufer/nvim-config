-- [nfnl] Compiled from fnl/config/keybind.fnl by https://github.com/Olical/nfnl, do not edit.
local function set_normal(k, command, opts)
  return vim.keymap.set("n", k, command, vim.tbl_extend("force", {noremap = true, silent = true, nowait = true}, opts))
end
local function set_terminal(k, command, opts)
  return vim.keymap.set("t", k, command, vim.tbl_extend("force", {noremap = true, silent = true, nowait = true}, opts))
end
local function telescope(command, theme)
  if (nil ~= theme) then
    return (":Telescope " .. command .. " theme=" .. theme .. "<cr>")
  else
    return (":Telescope " .. command .. "<cr>")
  end
end
local function set_normal_telescope(k, command, theme)
  return set_normal(k, telescope(command, theme), {desc = ("tele " .. command)})
end
set_normal_telescope("<leader>f*", "grep_string")
set_normal_telescope("<leader>f/", "current_buffer_fuzzy_find")
set_normal_telescope("<leader>fa", "autocommands")
set_normal_telescope("<leader>fb", "buffers")
set_normal_telescope("<leader>fc", "commands")
set_normal_telescope("<leader>fch", "command_history")
set_normal_telescope("<leader>fd", "diagnostics")
set_normal_telescope("<leader>ff", "file_browser")
set_normal_telescope("<leader>fg", "git_files")
set_normal_telescope("<leader>fh", "help_tags")
set_normal_telescope("<leader>fj", "jumplist")
set_normal_telescope("<leader>fk", "keymaps")
set_normal_telescope("<leader>fl", "live_grep")
set_normal_telescope("<leader>fm", "marks")
set_normal_telescope("<leader>fn", "resume")
set_normal_telescope("<leader>fo", "oldfiles")
set_normal_telescope("<leader>fp", "builtin")
set_normal_telescope("<leader>fr", "registers")
set_normal_telescope("<leader>fs", "search_history")
set_normal_telescope("<leader>ft", "filetypes")
set_normal_telescope("<leader>fv", "vim_options")
set_normal_telescope("<leader>lb", "lsp_document_symbols")
set_normal_telescope("<leader>lci", "lsp_incoming_calls")
set_normal_telescope("<leader>lco", "lsp_outgoing_calls")
set_normal_telescope("<leader>ld", "lsp_definitions")
set_normal_telescope("<leader>li", "lsp_implementations")
set_normal_telescope("<leader>lr", "lsp_references")
set_normal_telescope("<leader>ls", "lsp_dynamic_workspace_symbols")
set_normal_telescope("<leader>lt", "lsp_type_definitions")
set_normal_telescope("<leader>lw", "lsp_workspace_symbols")
set_normal_telescope("<leader>gc", "git_commits")
set_normal_telescope("<leader>gb", "git_bcommits")
set_normal_telescope("<leader>gh", "git_branches", "ivy")
set_normal_telescope("<leader>gs", "git_status", "ivy")
set_normal("<leader>gn", ":Git switch -c ", {desc = "new branch", silent = false})
set_normal_telescope("<leader>xh", "http list")
set_normal_telescope("<leader>xu", "undo")
set_normal("<leader>lls", ":lua vim.lsp.codelens.run()<CR>", {desc = "codelens: run"})
set_normal("<leader>llr", ":lua vim.lsp.codelens.refresh()<CR>", {desc = "codelens: refresh"})
set_terminal("<Esc>", "<C-\\><C-n>", {desc = "term escape"})
set_normal("<leader><space>", ":ToggleTerm<CR>", {desc = "toggleterm"})
return {}
