-- [nfnl] Compiled from fnl/config/autocmd.fnl by https://github.com/Olical/nfnl, do not edit.
local function no_sign_column()
  local buf = vim.fn.expand("<abuf>")
  return vim.api.nvim_win_set_option(vim.fn.bufwinid(buf), "signcolumn", "no")
end
local group = vim.api.nvim_create_augroup("NvimTreeAU", {})
local function _1_(_ev)
  return vim.schedule(no_sign_column)
end
return vim.api.nvim_create_autocmd({"FileType"}, {group = group, pattern = {"NvimTree"}, callback = _1_})
