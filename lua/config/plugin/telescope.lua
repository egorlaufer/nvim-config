-- [nfnl] Compiled from fnl/config/plugin/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
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
    telescope.setup({defaults = vim.tbl_extend("force", themes.get_ivy(), {path_display = {truncate = 2}, extensions = {file_browser = {hijack_netrw = true}}})})
    telescope.load_extension("zf-native")
    telescope.load_extension("http")
    telescope.load_extension("undo")
    telescope.load_extension("http")
    telescope.load_extension("file_browser")
    return telescope.load_extension("tailiscope")
  else
    return nil
  end
end
return {config = config}
