-- [nfnl] Compiled from fnl/config/plugin/idris.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, idris = nil, nil
  local function _1_()
    return require("idris2")
  end
  ok_3f, idris = pcall(_1_)
  return idris.setup({})
end
return {config = config}
