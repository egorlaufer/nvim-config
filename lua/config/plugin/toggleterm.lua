-- [nfnl] Compiled from fnl/config/plugin/toggleterm.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function config(plugin, opts)
  local ok_3f, toggleterm = nil, nil
  local function _1_()
    return require("toggleterm")
  end
  ok_3f, toggleterm = pcall(_1_)
  if ok_3f then
    toggleterm.setup({})
    local function _2_()
      local group = vim.api.nvim_create_augroup("TermAU", {})
      vim.api.nvim_create_autocmd({"FileType"}, {group = group, pattern = {"toggleterm"}, command = "setlocal nospell"})
      vim.api.nvim_create_autocmd({"TermOpen"}, {group = group, command = "setlocal nospell"})
      vim.keymap.set("t", "<esc>", "<C-\\><C-n>", {noremap = true, silent = true, nowait = true, buffer = 0})
      vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", {noremap = true, silent = true, nowait = true, buffer = 0})
      vim.keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", {noremap = true, silent = true, nowait = true, buffer = 0})
      vim.keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", {noremap = true, silent = true, nowait = true, buffer = 0})
      vim.keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", {noremap = true, silent = true, nowait = true, buffer = 0})
      return vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", {noremap = true, silent = true, nowait = true, buffer = 0})
    end
    return vim.api.nvim_create_autocmd({"TermOpen"}, {group = group, pattern = "term://*", callback = _2_})
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
return {"akinsho/toggleterm.nvim", cmd = {"ToggleTerm"}, keys = {{"<leader><space>", ":ToggleTerm<cr>", mode = "n", silent = true, nowait = true, desc = "toggleterm"}}, config = _4_}
