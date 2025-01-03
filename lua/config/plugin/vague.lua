-- [nfnl] Compiled from fnl/config/plugin/vague.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function config(plugin, opts)
  do
    local tmp_3_auto = require("vague")
    if (nil ~= tmp_3_auto) then
      tmp_3_auto:setup(opts)
    else
    end
  end
  _G.vim.cmd("set background=dark")
  return _G.vim.cmd("colorscheme vague")
end
local function _2_(plugin_12_auto, opts_13_auto)
  local start_14_auto = _G.vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _3_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_3_)
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
return {"vague2k/vague.nvim", config = _2_, lazy = false}
