-- [nfnl] Compiled from fnl/config/plugin.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local ok_3f, lazy = nil, nil
  local function _1_()
    return require("lazy")
  end
  ok_3f, lazy = pcall(_1_)
  if ok_3f then
    lazy.setup({{"Olical/nfnl", ft = "fennel", lazy = false}, {"j-hui/fidget.nvim", opts = {progress = {poll_rate = 10, lsp = {progress_ringbuf_size = 2048, log_handler = true}}, notification = {poll_rate = 10, override_vim_notify = true}}, lazy = false}, require("config.plugin.conjure"), require("config.plugin.nvim-lspconfig"), require("config.plugin.leap"), require("config.plugin.treesitter"), require("config.plugin.lualine"), require("config.plugin.undotree"), require("config.plugin.cmp"), require("config.plugin.conform"), require("config.plugin.which-key"), require("config.plugin.telescope"), require("config.plugin.octo"), require("config.plugin.vim-commentary"), require("config.plugin.vim-fugitive"), require("config.plugin.vim-surround"), require("config.plugin.guess-indent"), require("config.plugin.whitespace"), require("config.plugin.nvim-tree"), require("config.plugin.nvim-dap"), require("config.plugin.nvim-dap-ui"), require("config.plugin.rust-tools"), require("config.plugin.toggleterm"), require("config.plugin.rose-pine"), require("config.plugin.vim-expand-region"), require("config.plugin.nui"), require("config.plugin.idris2"), require("config.plugin.vim-characterize"), require("config.plugin.vim-rooter"), require("config.plugin.plenary"), require("config.plugin.todo-comments"), require("config.plugin.trouble"), require("config.plugin.cheatsheet"), require("config.plugin.melange"), {"PaterJason/nvim-treesitter-sexp", ft = {"fennel", "clojure", "lisp"}, opts = {}}, {"monkoose/nvlime", ft = {"lisp"}, dependencies = {{"monkoose/parsley"}}}})
  else
  end
end
return {}
