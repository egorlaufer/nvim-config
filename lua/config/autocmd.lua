-- [nfnl] Compiled from fnl/config/autocmd.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(ev)
  print("au")
  local function _2_()
    local buf = vim.fn.expand("<abuf>")
    return vim.api.nvim_win_set_option(vim.fn.bufwinid(buf), "signcolumn", "no")
  end
  return vim.schedule(_2_)
end
return vim.api.nvim_create_autocmd({"FileType"}, {group = vim.api.nvim_create_augroup("NvimTreeAU", {}), pattern = {"NvimTree"}, callback = _1_})
