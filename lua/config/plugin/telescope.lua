-- [nfnl] Compiled from fnl/config/plugin/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, telescope = nil, nil
  local function _1_()
    return require("telescope")
  end
  ok_3f, telescope = pcall(_1_)
  if ok_3f then
    telescope.load_extension("zf-native")
    telescope.load_extension("http")
    telescope.load_extension("undo")
    telescope.load_extension("http")
    return telescope.setup({defaults = {path_display = {truncate = 2}}})
  else
    return nil
  end
end
return {config = config}
