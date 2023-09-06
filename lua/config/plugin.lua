-- [nfnl] Compiled from fnl/config/plugin.fnl by https://github.com/Olical/nfnl, do not edit.
local function config_conjure(plugin, opts)
  local ok_3f, conjure = nil, nil
  local function _1_()
    return require("conjure")
  end
  ok_3f, conjure = pcall(_1_)
  if ok_3f then
    vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
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
    return lspconfig.lua_ls.setup({})
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
  local symbols_map = {{word = ":alpha", label = "\206\177 alpha", insertText = "\206\177", filterText = ":alpha"}, {word = ":Alpha", label = "\206\145 Alpha", insertText = "\206\177", filterText = ":Alpha"}, {word = ":beta", label = "\206\178 beta", insertText = "\206\178", filterText = ":beta"}, {word = ":Beta", label = "\206\146 Beta", insertText = "\206\146", filterText = ":Beta"}, {word = ":gamma", label = "\206\179 gamma", insertText = "\206\179", filterText = ":gamma"}, {word = ":Gamma", label = "\206\147 Gamma", inertText = "\206\147", filterText = ":Gamma"}, {word = ":delta", label = "\206\180 delta", insertText = "\206\180", filterText = ":delta"}, {word = ":Delta", label = "\206\148 Delta", insertText = "\206\148", filterText = ":Delta"}, {word = ":epsilon", label = "\206\181 epsilon", insertText = "\206\181", filterText = ":epsilon"}, {word = ":Epsilon", label = "\206\149 Epsilon", insertText = "\206\149", filterText = ":Epsilon"}, {word = ":zeta", label = "\206\182 zeta", insertText = "\206\182", filterText = ":zeta"}, {word = ":Zeta", label = "\206\150 Zeta", insertText = "\206\150", filterText = ":Zeta"}, {word = ":eta", label = "\206\183 eta", insertText = "\206\183", filterText = ":eta"}, {word = ":Eta", label = "\206\151 Eta", insertText = "\206\151", filterText = ":Eta"}, {word = ":theta", label = "\206\184 theta", insertText = "\206\184", filterText = ":theta"}, {word = ":Theta", label = "\206\152 Theta", insertText = "\206\152", filterText = ":Theta"}, {word = ":iota", label = "\206\185 iota", insertText = "\206\185", filterText = ":iota"}, {word = ":Iota", label = "\206\153 Iota", insertText = "\206\153", filterText = ":Iota"}, {word = ":kappa", label = "\206\186 kappa", insertText = "\206\186", filterText = ":kappa"}, {word = ":Kappa", label = "\206\154 Kappa", insertText = "\206\154", filterText = ":Kappa"}, {word = ":lambda", label = "\206\187 lambda", insertText = "\206\187", filterText = ":lambda"}, {word = ":Lambda", label = "\206\155 Lambda", insertText = "\206\155", filterText = ":Lambda"}, {word = ":mu", label = "\206\188 mu", insertText = "\206\188", filterText = ":mu"}, {word = ":Mu", label = "\206\156 Mu", insertText = "\206\156", filterText = ":Mu"}, {word = ":nu", label = "\206\189 nu", insertText = "\206\189", filterText = ":nu"}, {word = ":Nu", label = "\206\157 Nu", insertText = "\206\157", filterText = ":Nu"}, {word = ":xi", label = "\206\190 xi", insertText = "\206\190", filterText = ":xi"}, {word = ":Xi", label = "\206\158 Xi", insertText = "\206\158", filterText = ":Xi"}, {word = ":omicron", label = "\206\191 omicron", insertText = "\206\191", filterText = ":omicron"}, {word = ":Omicron", label = "\206\159 Omicron", insertText = "\206\159", filterText = ":Omicron"}, {word = ":pi", label = "\207\128 pi", insertText = "\207\128", filterText = ":pi"}, {word = ":Pi", label = "\206\160 Pi", insertText = "\206\160", filterText = ":Pi"}, {word = ":rho", label = "\207\129 rho", insertText = "\207\129", filterText = ":rho"}, {word = ":Rho", label = "\206\161 Rho", insertText = "\206\161", filterText = ":Rho"}, {word = ":sigma", label = "\207\131 sigma", insertText = "\207\131", filterText = ":sigma"}, {word = ":Sigma", label = "\206\163 Sigma", insertText = "\206\163", filterText = ":Sigma"}, {word = ":tau", label = "\207\132 tau", insertText = "\207\132", filterText = ":tau"}, {word = ":Tau", label = "\206\164 Tau", insertText = "\206\164", filterText = ":Tau"}, {word = ":upsilon", label = "\207\133 upsilon", insertText = "\207\133", filterText = ":upsilon"}, {word = ":Upsilon", label = "\206\165 Upsilon", insertText = "\206\165", filterText = ":Upsilon"}, {word = ":phi", label = "\206\166 phi", insertText = "\206\166", filterText = ":phi"}, {word = ":Phi", label = "\206\166 Phi", insertText = "\206\166", filterText = ":Phi"}, {word = ":chi", label = "\207\135 chi", insertText = "\207\135", filterText = ":chi"}, {word = ":Chi", label = "\206\167 Chi", insertText = "\206\167", filterText = ":Chi"}, {word = ":psi", label = "\207\136 psi", insertText = "\207\136", filterText = ":psi"}, {word = ":Psi", label = "\206\168 Psi", insertText = "\206\168", filterText = ":Psi"}, {word = ":omega", label = "\207\137 omega", insertText = "\207\137", filterText = ":omega"}, {word = ":Omega", label = "\206\169 Omega", insertText = "\206\169", filterText = "Omega:"}, {word = ":lozenge", label = "\226\151\138 lozenge", insertText = "\226\151\138", filterText = ":lozenge"}}
  local greek_source_option
  local function _11_(_, params)
    local params0
    if params then
      params0 = params
    else
      params0 = {option = {}}
    end
    return vim.tbl_extend("force", {insert = false}, (params0).option)
  end
  greek_source_option = _11_
  local greek_source_trigger
  local function _13_()
    return {":"}
  end
  greek_source_trigger = _13_
  local greek_source_complete
  local function _14_(self, params, callback)
    local params0
    if params then
      params0 = params
    else
      params0 = {}
    end
    if (self.option(params0)).insert then
      if not self.insert_items then
        local function _16_(item)
          item["word"] = nil
          return item
        end
        self["insert_items"] = vim.tbl_map(_16_, symbols_map)
      else
      end
      return callback(self.insert_items)
    else
      if not self.commit_items then
        self["commit_items"] = symbols_map
      else
      end
      return callback(self.commit_items)
    end
  end
  greek_source_complete = _14_
  local greek_source
  local function greek_source_new()
    return {option = greek_source_option, get_trigger_characters = greek_source_trigger, complete = greek_source_complete, commit_items = nil, insert_items = nil, new = greek_source_new}
  end
  greek_source = greek_source_new()
  local ok_3f, cmp = nil, nil
  local function _20_()
    return require("cmp")
  end
  ok_3f, cmp = pcall(_20_)
  if ok_3f then
    cmp.register_source("greek", greek_source)
    cmp.setup({sources = {{name = "conjure"}, {name = "nvim_lsp"}, {name = "buffer"}, {name = "path"}, {name = "greek"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}, {name = "nvim_lua"}}, view = {entries = "native"}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = false})})})
    return cmp.setup.filetype("gitcommit", {sources = {{name = "cmp_git"}, {name = "path"}, {name = "buffer"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}}})
  else
    return nil
  end
end
local function config_format_on_save(plugin, opts)
  local ok1_3f, fos = nil, nil
  local function _22_()
    return require("format-on-save")
  end
  ok1_3f, fos = pcall(_22_)
  local ok2_3f, fos_formatters = nil, nil
  local function _23_()
    return require("format-on-save.formatters")
  end
  ok2_3f, fos_formatters = pcall(_23_)
  local tempfile
  local function _24_()
    return (vim.fn.expand("%") .. ".formatter-temp")
  end
  tempfile = _24_
  local fnlcmd = {"fnlfmt", "--fix", "%"}
  local fnlfmt = fos_formatters.shell({cmd = fnlcmd, tempfile = tempfile})
  if (ok1_3f and ok2_3f) then
    return fos.setup({exclude_path_patterns = {"/node_modules/"}, formatter_by_ft = {fennel = fnlfmt}, experiments = {partial_update = "diff"}})
  else
    return nil
  end
end
local ok_3f, lazy = nil, nil
local function _26_()
  return require("lazy")
end
ok_3f, lazy = pcall(_26_)
if ok_3f then
  local function _27_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_conjure)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-conjure"))
      return true
    end
  end
  local function _29_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_nvim_lspconfig)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-nvim-lspconfig"))
      return true
    end
  end
  local function _31_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_rose_pine)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-rose-pine"))
      return true
    end
  end
  local function _33_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_leap)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-leap"))
      return true
    end
  end
  local function _35_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_treesitter)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-treesitter"))
      return true
    end
  end
  local function _37_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_cmp)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-cmp"))
      return true
    end
  end
  local function _39_()
    local ok_3f_2_auto, _res_3_auto = pcall(config_format_on_save)
    if ok_3f_2_auto then
      return false
    else
      print(("Failed configuring: " .. "config-format-on-save"))
      return true
    end
  end
  return lazy.setup({{"Olical/nfnl", ft = "fennel", lazy = true}, {"Olical/conjure", ft = "fennel", config = _27_, lazy = true}, {"neovim/nvim-lspconfig", ft = {"fennel", "lua"}, config = _29_, dependencies = {{"ray-x/lsp_signature.nvim"}}, lazy = true}, {"rose-pine/neovim", config = _31_, lazy = false}, {"ggandor/leap.nvim", config = _33_, lazy = false}, {"nvim-treesitter/nvim-treesitter", ft = {"fennel", "lua"}, config = _35_, lazy = true}, {"nvim-lualine/lualine.nvim", opts = {}, lazy = false}, {"mbbill/undotree", cmd = {"UndoTreeToggle", "UndoTreeHide", "UndoTreeShow", "UndoTreeFocus"}, lazy = true, opts = {}}, {"hrsh7th/nvim-cmp", dependencies = {{"PaterJason/cmp-conjure"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-omni"}, {"hrsh7th/cmp-nvim-lua"}}, config = _37_, lazy = false}, {"elentok/format-on-save.nvim", config = _39_, lazy = false}, {"folke/which-key.nvim", opts = {}, lazy = false}, {"nvim-telescope/telescope.nvim", cmd = "Telescope", dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-symbols.nvim"}, {"nvim-telescope/telescope-ui-select.nvim"}, {"barrett-ruth/telescope-http.nvim"}, {"danielvolchek/tailiscope.nvim"}, {"nvim-telescope/telescope-dap.nvim"}, {"nvim-treesitter/nvim-treesitter"}}}, {"https://gitlab.com/HiPhish/rainbow-delimiters.nvim", lazy = false}, {"tpope/vim-commentary"}, {"tpope/vim-fugitive"}, {"tpope/vim-surround"}, {"NMAC427/guess-indent.nvim", lazy = false}, {"jdhao/whitespace.nvim", lazy = false}, {"kyazdani42/nvim-tree.lua", cmd = {"NvimTreeToggle", "NvimTreeClipboard", "NvimTreeClose", "NvimTreeCollapse", "NvimTreeCollapseKeepBuffers", "NvimTreeFindFile", "NvimTreeFindFileToggle", "NvimTreeFocus", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeResize", "NvimTreeToggle"}, lazy = true, opts = {}}, {"mfussenegger/nvim-dap"}, {"rcarriga/nvim-dap-ui"}, {"simrat39/rust-tools.nvim", dependencies = {{"nvim-lua/plenary.nvim"}}}, {"akinsho/toggleterm.nvim"}, {"rose-pine/neovim", lazy = false}, {"terryma/vim-expand-region"}})
else
  return nil
end
