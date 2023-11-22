-- [nfnl] Compiled from fnl/config/plugin/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, conjure = nil, nil
  local function _1_()
    return require("conjure")
  end
  ok_3f, conjure = pcall(_1_)
  if ok_3f then
    vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
    vim.g["conjure#extract#tree_sitter#enabled"] = true
    return nil
  else
    return nil
  end
end
return {config = config}
