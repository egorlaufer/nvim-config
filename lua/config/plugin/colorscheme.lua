-- [nfnl] Compiled from fnl/config/plugin/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  vim.cmd("set background=dark")
  return vim.cmd("colorscheme melange")
end
return {config = config}
