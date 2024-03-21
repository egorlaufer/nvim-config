-- [nfnl] Compiled from fnl/config/autocmd.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local group = vim.api.nvim_create_augroup("TermAU", {})
  vim.api.nvim_create_autocmd({"FileType"}, {group = group, pattern = {"toggleterm"}, command = "setlocal nospell"})
  vim.api.nvim_create_autocmd({"TermOpen"}, {group = group, command = "setlocal nospell"})
end
return {}
