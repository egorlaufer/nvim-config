-- [nfnl] Compiled from fnl/config/plugin/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function config(plugin, opts)
  local ok_3f, telescope = nil, nil
  local function _1_()
    return require("telescope")
  end
  ok_3f, telescope = pcall(_1_)
  local _ok, themes = nil, nil
  local function _2_()
    return require("telescope.themes")
  end
  _ok, themes = pcall(_2_)
  if ok_3f then
    telescope.setup({defaults = vim.tbl_extend("force", themes.get_ivy(), {path_display = {truncate = 2}, extensions = {file_browser = {hijack_netrw = true}}})})
    telescope.load_extension("zf-native")
    telescope.load_extension("undo")
    telescope.load_extension("file_browser")
    telescope.load_extension("tailiscope")
    telescope.load_extension("luasnip")
    return telescope.load_extension("undo")
  else
    return nil
  end
end
local function _4_(plugin_12_auto, opts_13_auto)
  local start_14_auto = vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _5_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_5_)
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
return {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _4_, dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"nvim-telescope/telescope-dap.nvim"}, {"nvim-treesitter/nvim-treesitter"}, {"natecraddock/telescope-zf-native.nvim"}, {"debugloop/telescope-undo.nvim"}, {"nvim-telescope/telescope-file-browser.nvim"}, {"danielvolchek/tailiscope.nvim"}, {"benfowler/telescope-luasnip.nvim"}, {"debugloop/telescope-undo.nvim"}, {{"rachartier/tiny-code-action.nvim", opts = {}}}}}
