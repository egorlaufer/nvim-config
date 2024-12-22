-- [nfnl] Compiled from fnl/config/plugin/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function config(plugin, opts)
  local ok_3f, telescope = nil, nil
  local function _1_()
    return require("telescope")
  end
  ok_3f, telescope = pcall(_1_)
  local _ok, themes = nil, nil
  local function _2_()
    return require("telescope.themes")
  end
  _ok, themes = pcall(_2_)
  if ok_3f then
    telescope.setup({defaults = _G.vim.tbl_extend("force", themes.get_ivy(), {path_display = {truncate = 2}, extensions = {file_browser = {hijack_netrw = true}}})})
    telescope.load_extension("zf-native")
    telescope.load_extension("undo")
    telescope.load_extension("file_browser")
    telescope.load_extension("tailiscope")
    telescope.load_extension("luasnip")
    return telescope.load_extension("undo")
  else
    return nil
  end
end
local function tele_key(keys, command)
  return {keys, (":Telescope " .. command .. "<cr>"), mode = "n", silent = true, nowait = true, desc = ("tele " .. command)}
end
local function _4_(plugin_12_auto, opts_13_auto)
  local start_14_auto = _G.vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _5_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_5_)
  local ok_3f_17_auto, res_18_auto = pcall(config, plugin_12_auto, opts_13_auto)
  if ok_3f_17_auto then
    if fidget_3f_15_auto then
      local ms_19_auto = ((_G.vim.loop.hrtime() - start_14_auto) / 1000000)
      fidget_16_auto.notify((mod .. " in " .. ms_19_auto .. "ms"))
    else
    end
    return true
  else
    if fidget_3f_15_auto then
      fidget_16_auto.notify(("Failed configuring: " .. mod .. res_18_auto))
    else
      print(("Failed configuring: " .. mod .. res_18_auto))
    end
    return false
  end
end
return {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _4_, dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"nvim-telescope/telescope-dap.nvim"}, {"nvim-treesitter/nvim-treesitter"}, {"natecraddock/telescope-zf-native.nvim"}, {"debugloop/telescope-undo.nvim"}, {"nvim-telescope/telescope-file-browser.nvim"}, {"danielvolchek/tailiscope.nvim"}, {"benfowler/telescope-luasnip.nvim"}, {"debugloop/telescope-undo.nvim"}, {{"rachartier/tiny-code-action.nvim", opts = {}}}}, keys = {tele_key("<leader>f*", "grep_string"), tele_key("<leader>f/", "current_buffer_fuzzy_find"), tele_key("<leader>fa", "autocommands"), tele_key("<leader>fb", "buffers"), tele_key("<leader>fc", "commands"), tele_key("<leader>fch", "command_history"), tele_key("<leader>fd", "diagnostics"), tele_key("<leader>ff", "file_browser"), tele_key("<leader>fg", "git_files"), tele_key("<leader>fh", "help_tags"), tele_key("<leader>fj", "jumplist"), tele_key("<leader>fk", "keymaps"), tele_key("<leader>fl", "live_grep"), tele_key("<leader>fm", "marks"), tele_key("<leader>fn", "resume"), tele_key("<leader>fo", "oldfiles"), tele_key("<leader>fp", "builtin"), tele_key("<leader>fr", "registers"), tele_key("<leader>fs", "search_history"), tele_key("<leader>ft", "filetypes"), tele_key("<leader>fv", "vim_options"), tele_key("<leader>lb", "lsp_document_symbols"), tele_key("<leader>lci", "lsp_incoming_calls"), tele_key("<leader>lco", "lsp_outgoing_calls"), tele_key("<leader>ld", "lsp_definitions"), tele_key("<leader>li", "lsp_implementations"), tele_key("<leader>lr", "lsp_references"), tele_key("<leader>ls", "lsp_dynamic_workspace_symbols"), tele_key("<leader>lt", "lsp_type_definitions"), tele_key("<leader>lw", "lsp_workspace_symbols"), tele_key("<leader>gc", "git_commits"), tele_key("<leader>gb", "git_bcommits"), tele_key("<leader>gh", "git_branches"), tele_key("<leader>gs", "git_status"), tele_key("<leader>xu", "undo")}}
