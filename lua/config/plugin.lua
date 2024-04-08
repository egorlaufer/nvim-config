-- [nfnl] Compiled from fnl/config/plugin.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local ok_3f, lazy = nil, nil
  local function _1_()
    return require("lazy")
  end
  ok_3f, lazy = pcall(_1_)
  if ok_3f then
    local function _2_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _3_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _3_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _4_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_4_)
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.colorscheme", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.colorscheme" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.colorscheme" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.colorscheme" .. res_10_auto))
        end
        return false
      end
    end
    lazy.setup({{"Olical/nfnl", ft = "fennel", lazy = false}, {"j-hui/fidget.nvim", opts = {progress = {poll_rate = 10, lsp = {progress_ringbuf_size = 2048, log_handler = true}}, notification = {poll_rate = 10, override_vim_notify = true}}, lazy = false}, require("config.plugin.conjure"), require("config.plugin.nvim-lspconfig"), require("config.plugin.leap"), require("config.plugin.treesitter"), require("config.plugin.lualine"), require("config.plugin.undotree"), require("config.plugin.cmp"), require("config.plugin.conform"), require("config.plugin.which-key"), require("config.plugin.telescope"), require("config.plugin.octo"), require("config.plugin.vim-commentary"), require("config.plugin.vim-fugitive"), require("config.plugin.vim-surround"), require("config.plugin.guess-indent"), require("config.plugin.whitespace"), require("config.plugin.nvim-tree"), require("config.plugin.nvim-dap"), require("config.plugin.nvim-dap-ui"), require("config.plugin.rust-tools"), require("config.plugin.toggleterm"), require("config.plugin.rose-pine"), require("config.plugin.vim-expand-region"), require("config.plugin.nui"), require("config.plugin.idris2"), {"tpope/vim-characterize", lazy = false}, {"airblade/vim-rooter", lazy = false}, {"nvim-lua/plenary.nvim", lazy = false}, {"folke/todo-comments.nvim", dependencies = {{"nvim-lua/plenary.nvim"}, {"folke/trouble.nvim"}}, opts = {}, lazy = false}, {"folke/trouble.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}, opts = {}, lazy = false}, {"doctorfree/cheatsheet.nvim", opts = {}, lazy = false}, {"savq/melange-nvim", config = _2_, lazy = false}, {"PaterJason/nvim-treesitter-sexp", ft = {"fennel", "clojure", "lisp"}, opts = {}}, {"monkoose/nvlime", ft = {"lisp"}, dependencies = {{"monkoose/parsley"}}}})
  else
  end
end
return {}
