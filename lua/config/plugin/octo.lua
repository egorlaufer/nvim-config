-- [nfnl] Compiled from fnl/config/plugin/octo.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, octo = nil, nil
  local function _1_()
    return require("octo")
  end
  ok_3f, octo = pcall(_1_)
  if ok_3f then
    return octo.setup({})
  else
    return nil
  end
end
return {config = config}
