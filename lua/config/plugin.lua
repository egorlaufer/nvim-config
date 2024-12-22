-- [nfnl] Compiled from fnl/config/plugin.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local ok_3f, lazy = nil, nil
  local function _1_()
    return require("lazy")
  end
  ok_3f, lazy = pcall(_1_)
  if ok_3f then
    lazy.setup({require("config.plugin.nfnl"), require("config.plugin.fidget"), require("config.plugin.oil"), require("config.plugin.conjure"), require("config.plugin.leap"), require("config.plugin.treesitter"), require("config.plugin.nvim-treesitter-sexp"), require("config.plugin.nvim-treesitter-textobjects"), require("config.plugin.lualine"), require("config.plugin.undotree"), require("config.plugin.cmp"), require("config.plugin.conform"), require("config.plugin.which-key"), require("config.plugin.telescope"), require("config.plugin.vim-commentary"), require("config.plugin.vim-fugitive"), require("config.plugin.guess-indent"), require("config.plugin.whitespace"), require("config.plugin.nvim-dap"), require("config.plugin.nvim-dap-ui"), require("config.plugin.rust-tools"), require("config.plugin.toggleterm"), require("config.plugin.rose-pine"), require("config.plugin.vim-expand-region"), require("config.plugin.nui"), require("config.plugin.idris2"), require("config.plugin.vim-characterize"), require("config.plugin.plenary"), require("config.plugin.todo-comments"), require("config.plugin.cheatsheet"), require("config.plugin.vague"), require("config.plugin.smear-cursor"), require("config.plugin.nvim-surround"), require("config.plugin.dadbod"), require("config.plugin.nvim-lspconfig"), require("config.plugin.lsp-lines"), require("config.plugin.borderline"), require("config.plugin.dressing")})
  else
  end
end
return {}
