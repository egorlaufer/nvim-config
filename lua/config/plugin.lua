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
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.nvim-lspconfig", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.nvim-lspconfig" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.nvim-lspconfig" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.nvim-lspconfig" .. res_10_auto))
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
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.leap", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.leap" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.leap" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.leap" .. res_10_auto))
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
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.treesitter", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.treesitter" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.treesitter" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.treesitter" .. res_10_auto))
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
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.lualine", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.lualine" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.lualine" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.lualine" .. res_10_auto))
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
      local ok_3f_9_auto, res_10_auto = pcall(load_and_configure_4_auto, "config.plugin.undotree", plugin_1_auto, opts_2_auto)
      if ok_3f_9_auto then
        if fidget_3f_7_auto then
          local ms_11_auto = ((vim.loop.hrtime() - start_3_auto) / 1000000)
          fidget_8_auto.notify(("config.plugin.undotree" .. " in " .. ms_11_auto .. "ms"))
        else
        end
        return true
      else
        if fidget_3f_7_auto then
          fidget_8_auto.notify(("Failed configuring: " .. "config.plugin.undotree" .. res_10_auto))
        else
          print(("Failed configuring: " .. "config.plugin.undotree" .. res_10_auto))
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
    local function _44_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _45_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _45_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _46_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_46_)
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
    local function _50_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _51_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _51_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _52_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_52_)
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
    local function _56_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _57_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _57_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _58_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_58_)
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
    local function _62_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _63_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _63_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _64_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_64_)
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
    local function _68_(plugin_1_auto, opts_2_auto)
      local start_3_auto = vim.loop.hrtime()
      local load_and_configure_4_auto
      local function _69_(f_5_auto, plugin_1_auto0, opts_2_auto0)
        local m_6_auto = require(f_5_auto)
        return m_6_auto.config(plugin_1_auto0, opts_2_auto0)
      end
      load_and_configure_4_auto = _69_
      local fidget_3f_7_auto, fidget_8_auto = nil, nil
      local function _70_()
        return require("fidget")
      end
      fidget_3f_7_auto, fidget_8_auto = pcall(_70_)
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
    lazy.setup({{"Olical/nfnl", ft = "fennel", lazy = false}, {"j-hui/fidget.nvim", opts = {progress = {poll_rate = 10, lsp = {progress_ringbuf_size = 2048, log_handler = true}}, notification = {poll_rate = 10, override_vim_notify = true}}, lazy = false}, require("config.plugin.conjure"), {"neovim/nvim-lspconfig", ft = {"fennel", "lua", "erlang", "elixir", "rust", "idris2"}, config = _2_, dependencies = {{"ray-x/lsp_signature.nvim"}}, lazy = true}, {"ggandor/leap.nvim", config = _8_, lazy = false}, {"nvim-treesitter/nvim-treesitter", ft = {"fennel", "lua", "rust", "erlang", "elixir", "idris2"}, config = _14_, lazy = true}, {"nvim-lualine/lualine.nvim", config = _20_, opts = {theme_light = "melange", theme_dark = "melange"}, lazy = false}, {"mbbill/undotree", cmd = {"UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus"}, lazy = true, config = _26_, opts = {}}, {"hrsh7th/nvim-cmp", dependencies = {{"PaterJason/cmp-conjure"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-omni"}, {"hrsh7th/cmp-nvim-lua"}, {"L3MON4D3/LuaSnip"}, {"saadparwaiz1/cmp_luasnip"}}, config = _32_, event = "InsertEnter"}, {"stevearc/conform.nvim", config = _38_, lazy = false}, {"folke/which-key.nvim", opts = {}, lazy = false}, {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _44_, dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"barrett-ruth/telescope-http.nvim"}, {"nvim-telescope/telescope-dap.nvim"}, {"nvim-treesitter/nvim-treesitter"}, {"natecraddock/telescope-zf-native.nvim"}, {"debugloop/telescope-undo.nvim"}, {"nvim-telescope/telescope-file-browser.nvim"}, {"danielvolchek/tailiscope.nvim"}, {"benfowler/telescope-luasnip.nvim"}, {"debugloop/telescope-undo.nvim"}}}, {"pwntester/octo.nvim", config = _50_, dependencies = {{"nvim-tree/nvim-web-devicons"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope.nvim"}}}, {"tpope/vim-commentary"}, {"tpope/vim-fugitive"}, {"tpope/vim-surround"}, {"NMAC427/guess-indent.nvim", lazy = false}, {"jdhao/whitespace.nvim", lazy = false}, {"kyazdani42/nvim-tree.lua", cmd = {"NvimTreeToggle", "NvimTreeClipboard", "NvimTreeClose", "NvimTreeCollapse", "NvimTreeCollapseKeepBuffers", "NvimTreeFindFile", "NvimTreeFindFileToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeResize", "NvimTreeToggle"}, lazy = true, opts = {}}, {"mfussenegger/nvim-dap"}, {"rcarriga/nvim-dap-ui"}, {"simrat39/rust-tools.nvim", dependencies = {{"nvim-lua/plenary.nvim"}}}, {"akinsho/toggleterm.nvim", cmd = {"ToggleTerm"}, config = _56_}, {"rose-pine/neovim", lazy = false}, {"terryma/vim-expand-region", lazy = false}, {"MunifTanjim/nui.nvim", lazy = false}, {"ShinKage/idris2-nvim", requires = {"neovim/nvim-lspconfig", "MunifTanjim/nui.nvim"}, ft = {"idris2"}, config = _62_}, {"tpope/vim-characterize", lazy = false}, {"airblade/vim-rooter", lazy = false}, {"nvim-lua/plenary.nvim", lazy = false}, {"folke/todo-comments.nvim", dependencies = {{"nvim-lua/plenary.nvim"}, {"folke/trouble.nvim"}}, opts = {}, lazy = false}, {"folke/trouble.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}, opts = {}, lazy = false}, {"doctorfree/cheatsheet.nvim", opts = {}, lazy = false}, {"savq/melange-nvim", config = _68_, lazy = false}, {"PaterJason/nvim-treesitter-sexp", ft = {"fennel", "clojure", "lisp"}, opts = {}}, {"monkoose/nvlime", ft = {"lisp"}, dependencies = {{"monkoose/parsley"}}}})
  else
  end
end
return {}
