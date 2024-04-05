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
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.cmp", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.cmp" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.cmp" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.cmp" .. res_10_auto))
        end
        return false
      end
    end
    local function _8_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _9_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _9_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _10_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_10_)
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.conform", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.conform" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.conform" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.conform" .. res_10_auto))
        end
        return false
      end
    end
    local function _14_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _15_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _15_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _16_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_16_)
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.telescope", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.telescope" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.telescope" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.telescope" .. res_10_auto))
        end
        return false
      end
    end
    local function _20_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _21_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _21_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _22_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_22_)
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.octo", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.octo" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.octo" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.octo" .. res_10_auto))
        end
        return false
      end
    end
    local function _26_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _27_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _27_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _28_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_28_)
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.toggleterm", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.toggleterm" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.toggleterm" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.toggleterm" .. res_10_auto))
        end
        return false
      end
    end
    local function _32_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _33_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _33_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _34_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_34_)
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.idris2", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.idris2" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.idris2" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.idris2" .. res_10_auto))
        end
        return false
      end
    end
    local function _38_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _39_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _39_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _40_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_40_)
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
    lazy.setup({{"Olical/nfnl", ft = "fennel", lazy = false}, {"j-hui/fidget.nvim", opts = {progress = {poll_rate = 10, lsp = {progress_ringbuf_size = 2048, log_handler = true}}, notification = {poll_rate = 10, override_vim_notify = true}}, lazy = false}, require("config.plugin.conjure"), require("config.plugin.nvim-lspconfig"), require("config.plugin.leap"), require("config.plugin.treesitter"), require("config.plugin.lualine"), require("config.plugin.undotree"), {"hrsh7th/nvim-cmp", dependencies = {{"PaterJason/cmp-conjure"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-omni"}, {"hrsh7th/cmp-nvim-lua"}, {"L3MON4D3/LuaSnip"}, {"saadparwaiz1/cmp_luasnip"}}, config = _2_, event = "InsertEnter"}, {"stevearc/conform.nvim", config = _8_, lazy = false}, {"folke/which-key.nvim", opts = {}, lazy = false}, {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _14_, dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"barrett-ruth/telescope-http.nvim"}, {"nvim-telescope/telescope-dap.nvim"}, {"nvim-treesitter/nvim-treesitter"}, {"natecraddock/telescope-zf-native.nvim"}, {"debugloop/telescope-undo.nvim"}, {"nvim-telescope/telescope-file-browser.nvim"}, {"danielvolchek/tailiscope.nvim"}, {"benfowler/telescope-luasnip.nvim"}, {"debugloop/telescope-undo.nvim"}}}, {"pwntester/octo.nvim", config = _20_, dependencies = {{"nvim-tree/nvim-web-devicons"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope.nvim"}}}, {"tpope/vim-commentary"}, {"tpope/vim-fugitive"}, {"tpope/vim-surround"}, {"NMAC427/guess-indent.nvim", lazy = false}, {"jdhao/whitespace.nvim", lazy = false}, {"kyazdani42/nvim-tree.lua", cmd = {"NvimTreeToggle", "NvimTreeClipboard", "NvimTreeClose", "NvimTreeCollapse", "NvimTreeCollapseKeepBuffers", "NvimTreeFindFile", "NvimTreeFindFileToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeResize", "NvimTreeToggle"}, lazy = true, opts = {}}, {"mfussenegger/nvim-dap"}, {"rcarriga/nvim-dap-ui"}, {"simrat39/rust-tools.nvim", dependencies = {{"nvim-lua/plenary.nvim"}}}, {"akinsho/toggleterm.nvim", cmd = {"ToggleTerm"}, config = _26_}, {"rose-pine/neovim", lazy = false}, {"terryma/vim-expand-region", lazy = false}, {"MunifTanjim/nui.nvim", lazy = false}, {"ShinKage/idris2-nvim", requires = {"neovim/nvim-lspconfig", "MunifTanjim/nui.nvim"}, ft = {"idris2"}, config = _32_}, {"tpope/vim-characterize", lazy = false}, {"airblade/vim-rooter", lazy = false}, {"nvim-lua/plenary.nvim", lazy = false}, {"folke/todo-comments.nvim", dependencies = {{"nvim-lua/plenary.nvim"}, {"folke/trouble.nvim"}}, opts = {}, lazy = false}, {"folke/trouble.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}, opts = {}, lazy = false}, {"doctorfree/cheatsheet.nvim", opts = {}, lazy = false}, {"savq/melange-nvim", config = _38_, lazy = false}, {"PaterJason/nvim-treesitter-sexp", ft = {"fennel", "clojure", "lisp"}, opts = {}}, {"monkoose/nvlime", ft = {"lisp"}, dependencies = {{"monkoose/parsley"}}}})
  else
  end
end
return {}
