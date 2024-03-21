-- [nfnl] Compiled from fnl/config/plugin/undotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  vim.g["undotree_SplitWidth"] = 40
  return nil
end
return {config = config}
