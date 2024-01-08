-- [nfnl] Compiled from fnl/config/plugin.fnl by https://github.com/Olical/nfnl, do not edit.
local ok_3f, lazy = nil, nil
local function _1_()
  return require("lazy")
end
ok_3f, lazy = pcall(_1_)
if ok_3f then
  local function _2_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _3_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _3_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.conjure", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.conjure" .. res_8_auto))
      return true
    end
  end
  local function _5_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _6_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _6_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.nvim-lspconfig", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.nvim-lspconfig" .. res_8_auto))
      return true
    end
  end
  local function _8_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _9_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _9_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.rose-pine", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.rose-pine" .. res_8_auto))
      return true
    end
  end
  local function _11_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _12_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _12_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.leap", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.leap" .. res_8_auto))
      return true
    end
  end
  local function _14_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _15_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _15_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.treesitter", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.treesitter" .. res_8_auto))
      return true
    end
  end
  local function _17_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _18_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _18_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.cmp", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.cmp" .. res_8_auto))
      return true
    end
  end
  local function _20_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _21_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _21_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.format-on-save", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.format-on-save" .. res_8_auto))
      return true
    end
  end
  local function _23_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _24_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _24_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.telescope", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.telescope" .. res_8_auto))
      return true
    end
  end
  local function _26_(plugin_2_auto, opts_3_auto)
    local load_and_configure_4_auto
    local function _27_(f_5_auto, plugin_2_auto0, opts_3_auto0)
      local m_6_auto = require(f_5_auto)
      return m_6_auto.config(plugin_2_auto0, opts_3_auto0)
    end
    load_and_configure_4_auto = _27_
    local ok_3f_7_auto, res_8_auto = pcall(load_and_configure_4_auto, "config.plugin.idris2", plugin_2_auto, opts_3_auto)
    if ok_3f_7_auto then
      return false
    else
      print(("Failed configuring: " .. "config.plugin.idris2" .. res_8_auto))
      return true
    end
  end
  return lazy.setup({{"Olical/nfnl", ft = "fennel", lazy = false}, {"Olical/conjure", ft = "fennel", config = _2_, lazy = true}, {"neovim/nvim-lspconfig", ft = {"fennel", "lua", "erlang", "elixir", "rust", "idris2"}, config = _5_, dependencies = {{"ray-x/lsp_signature.nvim"}}, lazy = true}, {"rose-pine/neovim", config = _8_, lazy = false}, {"ggandor/leap.nvim", config = _11_, lazy = false}, {"nvim-treesitter/nvim-treesitter", ft = {"fennel", "lua", "rust", "erlang", "elixir", "idris2"}, config = _14_, lazy = true}, {"nvim-lualine/lualine.nvim", opts = {}, lazy = false}, {"mbbill/undotree", cmd = {"UndoTreeToggle", "UndoTreeHide", "UndoTreeShow", "UndoTreeFocus"}, lazy = true, opts = {}}, {"hrsh7th/nvim-cmp", dependencies = {{"PaterJason/cmp-conjure"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-omni"}, {"hrsh7th/cmp-nvim-lua"}}, config = _17_, lazy = false}, {"elentok/format-on-save.nvim", config = _20_, lazy = false}, {"folke/which-key.nvim", opts = {}, lazy = false}, {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _23_, dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"barrett-ruth/telescope-http.nvim"}, {"nvim-telescope/telescope-dap.nvim"}, {"nvim-treesitter/nvim-treesitter"}, {"natecraddock/telescope-zf-native.nvim"}, {"debugloop/telescope-undo.nvim"}}}, {"https://gitlab.com/HiPhish/rainbow-delimiters.nvim", lazy = false}, {"tpope/vim-commentary"}, {"tpope/vim-fugitive"}, {"tpope/vim-surround"}, {"NMAC427/guess-indent.nvim", lazy = false}, {"jdhao/whitespace.nvim", lazy = false}, {"kyazdani42/nvim-tree.lua", cmd = {"NvimTreeToggle", "NvimTreeClipboard", "NvimTreeClose", "NvimTreeCollapse", "NvimTreeCollapseKeepBuffers", "NvimTreeFindFile", "NvimTreeFindFileToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeResize", "NvimTreeToggle"}, lazy = true, opts = {}}, {"mfussenegger/nvim-dap"}, {"rcarriga/nvim-dap-ui"}, {"simrat39/rust-tools.nvim", dependencies = {{"nvim-lua/plenary.nvim"}}}, {"akinsho/toggleterm.nvim", cmd = {"ToggleTerm"}}, {"rose-pine/neovim", lazy = false}, {"terryma/vim-expand-region", lazy = false}, {"MunifTanjim/nui.nvim", lazy = false}, {"ShinKage/idris2-nvim", requires = {"neovim/nvim-lspconfig", "MunifTanjim/nui.nvim"}, ft = {"idris2"}, config = _26_}})
else
  return nil
end
