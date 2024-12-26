-- [nfnl] Compiled from fnl/config/plugin/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function config(plugin, opts)
  local ok_3f, lualine = nil, nil
  local function _1_()
    return require("lualine")
  end
  ok_3f, lualine = pcall(_1_)
  if ok_3f then
    local theme
    if (0 ~= _G.vim.fn.exists("g:neovide")) then
      theme = opts.theme_light
    else
      theme = opts.theme_dark
    end
    return lualine.setup({options = {theme = theme}})
  else
    return nil
  end
end
local function _4_(plugin_12_auto, opts_13_auto)
  local start_14_auto = _G.vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _5_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_5_)
  local ok_3f_17_auto, res_18_auto = pcall(config, plugin_12_auto, opts_13_auto)
  if ok_3f_17_auto then
    if fidget_3f_15_auto then
      local ms_19_auto = ((_G.vim.loop.hrtime() - start_14_auto) / 1000000)
      fidget_16_auto.notify((mod .. " in " .. ms_19_auto .. "ms"))
    else
    end
    return true
  else
    if fidget_3f_15_auto then
      fidget_16_auto.notify(("Failed configuring: " .. mod .. res_18_auto))
    else
      print(("Failed configuring: " .. mod .. res_18_auto))
    end
    return false
  end
end
return {"nvim-lualine/lualine.nvim", config = _4_, opts = {theme_light = "auto", theme_dark = "auto"}, event = "VeryLazy"}
