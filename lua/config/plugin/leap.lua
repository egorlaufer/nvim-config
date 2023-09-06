-- [nfnl] Compiled from fnl/config/plugin/leap.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, leap = nil, nil
  local function _1_()
    return require("leap")
  end
  ok_3f, leap = pcall(_1_)
  if ok_3f then
    return leap.add_default_mappings()
  else
    return nil
  end
end
return {config = config}
