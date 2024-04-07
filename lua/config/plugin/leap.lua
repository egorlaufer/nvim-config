-- [nfnl] Compiled from fnl/config/plugin/leap.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
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
local function _3_(plugin_12_auto, opts_13_auto)
  local start_14_auto = vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _4_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_4_)
  local ok_3f_17_auto, res_18_auto = pcall(config, plugin_12_auto, opts_13_auto)
  if ok_3f_17_auto then
    if fidget_3f_15_auto then
      local ms_19_auto = ((vim.loop.hrtime() - start_14_auto) / 1000000)
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
return {"ggandor/leap.nvim", config = _3_, lazy = false}
