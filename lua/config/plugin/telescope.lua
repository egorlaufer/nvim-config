-- [nfnl] Compiled from fnl/config/plugin/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, telescope = nil, nil
  local function _1_()
    return require("telescope")
  end
  ok_3f, telescope = pcall(_1_)
  if ok_3f then
    telescope.setup({defaults = {path_display = {truncate = 2}, theme = "ivy", extensions = {file_browser = {theme = "ivy", hijack_netrw = true}}}})
    telescope.load_extension("zf-native")
    telescope.load_extension("http")
    telescope.load_extension("undo")
    telescope.load_extension("http")
    return telescope.load_extension("file_browser")
  else
    return nil
  end
end
return {config = config}
