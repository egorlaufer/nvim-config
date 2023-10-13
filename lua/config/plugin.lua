-- [nfnl] Compiled from fnl/config/plugin.fnl by https://github.com/Olical/nfnl, do not edit.
local function config_conjure(plugin, opts)
  local ok_3f, conjure = nil, nil
  local function _1_()
    return require("conjure")
  end
  ok_3f, conjure = pcall(_1_)
  if ok_3f then
    vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
    vim.g["conjure#extract#tree_sitter#enabled"] = true
    return nil
  else
    return nil
  end
end
local function config_nvim_lspconfig(plugin, opts)
  local ok_3f, lspconfig = nil, nil
  local function _3_()
    return require("lspconfig")
  end
  ok_3f, lspconfig = pcall(_3_)
  if ok_3f then
    do
      local ok_3f0, lspconfig_configs = nil, nil
      local function _4_()
        return require("lspconfig.configs")
      end
      ok_3f0, lspconfig_configs = pcall(_4_)
      if ok_3f0 then
        lspconfig_configs.fennel_language_server = {default_config = {cmd = {"fennel-language-server"}, filetypes = {"fennel"}, single_file_support = true, root_dir = lspconfig.util.root_pattern("fnl"), settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths()}, diagnostics = {globals = {"vim"}}}}}}
      else
      end
    end
    lspconfig.fennel_language_server.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.elixirls.setup({cmd = {"elixir-ls"}})
    lspconfig.erlangls.setup({})
    return lspconfig.rust_analyzer.setup({})
  else
    return nil
  end
end
local function config_rose_pine(plugin, opts)
  vim.cmd("set background=dark")
  return vim.cmd("colorscheme rose-pine-moon")
end
local function config_treesitter(plugin, opts)
  local ok_3f, treesitter = nil, nil
  local function _7_()
    return require("nvim-treesitter.configs")
  end
  ok_3f, treesitter = pcall(_7_)
  if ok_3f then
    treesitter.setup({highlight = {enabled = true, additional_vim_regex_highlighting = false}})
    return vim.cmd("TSEnable highlight")
  else
    return nil
  end
end
local function config_leap(plugin, opts)
  local ok_3f, leap = nil, nil
  local function _9_()
    return require("leap")
  end
  ok_3f, leap = pcall(_9_)
  if ok_3f then
    return leap.add_default_mappings()
  else
    return nil
  end
end
local function config_cmp(plugin, opts)
  vim.o.completeopt = "menuone,noselect"
  local ok_3f, cmp = nil, nil
  local function _11_()
    return require("cmp")
  end
  ok_3f, cmp = pcall(_11_)
  if ok_3f then
    cmp.register_source("greek", __fnl_global__greek_2dsource)
    cmp.setup({sources = {{name = "conjure"}, {name = "nvim_lsp"}, {name = "buffer"}, {name = "path"}, {name = "greek"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}, {name = "nvim_lua"}}, view = {entries = "native"}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = false})})})
    return cmp.setup.filetype("gitcommit", {sources = {{name = "cmp_git"}, {name = "path"}, {name = "buffer"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}}})
  else
    return nil
  end
end
local function config_format_on_save(plugin, opts)
  local ok1_3f, fos = nil, nil
  local function _13_()
    return require("format-on-save")
  end
  ok1_3f, fos = pcall(_13_)
  local ok2_3f, fos_formatters = nil, nil
  local function _14_()
    return require("format-on-save.formatters")
  end
  ok2_3f, fos_formatters = pcall(_14_)
  local tempfile
  local function _15_()
    return (vim.fn.expand("%") .. ".formatter-temp")
  end
  tempfile = _15_
  local fnlcmd = {"fnlfmt", "--fix", "%"}
  local fnlfmt = fos_formatters.shell({cmd = fnlcmd, tempfile = tempfile})
  local mixformat = fos_formatters.shell({cmd = {"mix", "format", "%"}, tempfile = tempfile})
  if (ok1_3f and ok2_3f) then
    return fos.setup({exclude_path_patterns = {"/node_modules/"}, formatter_by_ft = {fennel = fnlfmt, elixir = mixformat, rust = fos_formatters.lsp}, experiments = {partial_update = "diff"}})
  else
    return nil
  end
end
local ok_3f, lazy = nil, nil
local function _17_()
  return require("lazy")
end
ok_3f, lazy = pcall(_17_)
if ok_3f then
  local function _18_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_conjure)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-conjure"))
      return true
    end
  end
  local function _20_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_nvim_lspconfig)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-nvim-lspconfig"))
      return true
    end
  end
  local function _22_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_rose_pine)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-rose-pine"))
      return true
    end
  end
  local function _24_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_leap)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-leap"))
      return true
    end
  end
  local function _26_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_treesitter)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-treesitter"))
      return true
    end
  end
  local function _28_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_cmp)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-cmp"))
      return true
    end
  end
  local function _30_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_format_on_save)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-format-on-save"))
      return true
    end
  end
  return lazy.setup({{"Olical/nfnl", ft = "fennel", lazy = true}, {"Olical/conjure", ft = "fennel", config = _18_, lazy = true}, {"neovim/nvim-lspconfig", ft = {"fennel", "lua", "erlang", "elixir", "rust"}, config = _20_, dependencies = {{"ray-x/lsp_signature.nvim"}}, lazy = true}, {"rose-pine/neovim", config = _22_, lazy = false}, {"ggandor/leap.nvim", config = _24_, lazy = false}, {"nvim-treesitter/nvim-treesitter", ft = {"fennel", "lua", "rust"}, config = _26_, lazy = true}, {"nvim-lualine/lualine.nvim", opts = {}, lazy = false}, {"mbbill/undotree", cmd = {"UndoTreeToggle", "UndoTreeHide", "UndoTreeShow", "UndoTreeFocus"}, lazy = true, opts = {}}, {"hrsh7th/nvim-cmp", dependencies = {{"PaterJason/cmp-conjure"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-omni"}, {"hrsh7th/cmp-nvim-lua"}}, config = _28_, lazy = false}, {"elentok/format-on-save.nvim", config = _30_, lazy = false}, {"folke/which-key.nvim", opts = {}, lazy = false}, {"nvim-telescope/telescope.nvim", cmd = "Telescope", dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-symbols.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"barrett-ruth/telescope-http.nvim"}, {"danielvolchek/tailiscope.nvim"}, {"nvim-telescope/telescope-dap.nvim"}, {"nvim-treesitter/nvim-treesitter"}}}, {"https://gitlab.com/HiPhish/rainbow-delimiters.nvim", lazy = false}, {"tpope/vim-commentary"}, {"tpope/vim-fugitive"}, {"tpope/vim-surround"}, {"NMAC427/guess-indent.nvim", lazy = false}, {"jdhao/whitespace.nvim", lazy = false}, {"kyazdani42/nvim-tree.lua", cmd = {"NvimTreeToggle", "NvimTreeClipboard", "NvimTreeClose", "NvimTreeCollapse", "NvimTreeCollapseKeepBuffers", "NvimTreeFindFile", "NvimTreeFindFileToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeResize", "NvimTreeToggle"}, lazy = true, opts = {}}, {"mfussenegger/nvim-dap"}, {"rcarriga/nvim-dap-ui"}, {"simrat39/rust-tools.nvim", dependencies = {{"nvim-lua/plenary.nvim"}}}, {"akinsho/toggleterm.nvim"}, {"rose-pine/neovim", lazy = false}, {"terryma/vim-expand-region"}})
else
  return nil
end
