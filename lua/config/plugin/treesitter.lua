-- [nfnl] Compiled from fnl/config/plugin/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function config(plugin, opts)
  local ok_3f, treesitter = nil, nil
  local function _1_()
    return require("nvim-treesitter.configs")
  end
  ok_3f, treesitter = pcall(_1_)
  if ok_3f then
    treesitter.setup({highlight = {enabled = true, additional_vim_regex_highlighting = false}})
    return vim.cmd("TSEnable highlight")
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
return {"nvim-treesitter/nvim-treesitter", ft = {"fennel", "lua", "rust", "erlang", "elixir", "idris2"}, config = _3_, lazy = true}
