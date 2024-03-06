-- [nfnl] Compiled from fnl/config/plugin/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  if (0 ~= vim.fn.exists("g:neovide")) then
    vim.cmd("set background=light")
    return vim.cmd("colorscheme melange")
  else
    vim.cmd("set background=dark")
    return vim.cmd("colorscheme melange")
  end
end
return {config = config}
