-- [nfnl] Compiled from fnl/config/plugin/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, lualine = nil, nil
  local function _1_()
    return require("lualine")
  end
  ok_3f, lualine = pcall(_1_)
  if ok_3f then
    local theme
    if (0 ~= vim.fn.exists("g:neovide")) then
      theme = opts.theme_light
    else
      theme = opts.theme_dark
    end
    return lualine.setup({options = {theme = theme}})
  else
    return nil
  end
end
return {config = config}
