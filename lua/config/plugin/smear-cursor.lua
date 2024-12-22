-- [nfnl] Compiled from fnl/config/plugin/smear-cursor.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function _1_(plugin_12_auto, opts_13_auto)
  local start_14_auto = vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _2_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_2_)
  local ok_3f_17_auto, res_18_auto = nil, nil
  local function _3_(_plugin, opts)
    if (0 == vim.fn.exists("g:neovide")) then
      do
        local tmp_3_auto = require("smear_cursor")
        if (nil ~= tmp_3_auto) then
          tmp_3_auto:setup(opts)
        else
        end
      end
      local tmp_3_auto = require("smear_cursor")
      if (nil ~= tmp_3_auto) then
        return tmp_3_auto:toggle()
      else
        return nil
      end
    else
      return nil
    end
  end
  ok_3f_17_auto, res_18_auto = pcall(_3_, plugin_12_auto, opts_13_auto)
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
return {"sphamba/smear-cursor.nvim", event = "VeryLazy", opts = {}, config = _1_}
