-- [nfnl] Compiled from fnl/config/plugin/rose-pine.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  vim.cmd("set background=dark")
  return vim.cmd("colorscheme rose-pine-moon")
end
return {config = config}
