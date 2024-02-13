-- [nfnl] Compiled from fnl/config/plugin/toggleterm.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, toggleterm = nil, nil
  local function _1_()
    return require("toggleterm")
  end
  ok_3f, toggleterm = pcall(_1_)
  if ok_3f then
    return toggleterm.setup({})
  else
    return nil
  end
end
return {config = config}
