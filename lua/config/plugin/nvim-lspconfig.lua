-- [nfnl] Compiled from fnl/config/plugin/nvim-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, lspconfig = nil, nil
  local function _1_()
    return require("lspconfig")
  end
  ok_3f, lspconfig = pcall(_1_)
  if ok_3f then
    do
      local ok_3f0, lspconfig_configs = nil, nil
      local function _2_()
        return require("lspconfig.configs")
      end
      ok_3f0, lspconfig_configs = pcall(_2_)
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
return {config = config}
