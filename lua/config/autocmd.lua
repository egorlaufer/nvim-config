-- [nfnl] Compiled from fnl/config/autocmd.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local group = vim.api.nvim_create_augroup("YankAU", {})
  local function _1_()
    return vim.highlight.on_yank()
  end
  vim.api.nvim_create_autocmd({"TextYankPost"}, {group = group, callback = _1_})
end
return {}
