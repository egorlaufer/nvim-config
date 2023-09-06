-- [nfnl] Compiled from fnl/config/plugin/nvim-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function custom_attach(client, bufnr)
  local function map(from, to)
    local to0 = (":" .. to .. "<cr>")
    return vim.api.nvim_buf_set_keymap(bufnr, "n", from, to0, {noremap = true})
  end
  map("gd", "lua vim.lsp.buf.definition()")
  map("gD", "lua vim.lsp.buf.declaration()")
  map("gr", "lua vim.lsp.buf.references()")
  map("gi", "lua vim.lsp.buf.implementation()")
  map("K", "lua vim.lsp.buf.hover()")
  map("<c-k>", "lua vim.lsp.buf.signature_help()")
  map("<c-p>", "lua vim.diagnostic.goto_prev()")
  map("<c-n>", "lua vim.diagnostic.goto_next()")
  map("<leader>lr", "lua vim.lsp.buf.rename()")
  map("<leader>lf", "lua vim.lsp.buf.format()")
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifuc")
  if client.server_capabilities.document_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>F", ":lua vim.lsp.buf.formatting_sync()<cr>", {noremap = true})
  else
  end
  if client.server_capabilities.document_range_formatting then
    vim.api.nvim_buf_set_keymap(bufnr, "x", "<leader>F", ":lua vim.lsp.buf.range_formatting()<cr>", {noremap = true})
  else
  end
  if (client.name == "omnisharp") then
    client.server_capabilities["semanticTokensProvider"] = nil
    return nil
  else
    return nil
  end
end
local function config(plugin, opts)
  local ok_3f, lspconfig = nil, nil
  local function _4_()
    return require("lspconfig")
  end
  ok_3f, lspconfig = pcall(_4_)
  if ok_3f then
    local ok_3f0, lspconfig_configs = nil, nil
    local function _5_()
      return require("lspconfig.configs")
    end
    ok_3f0, lspconfig_configs = pcall(_5_)
    local ok_3f1, cmp = nil, nil
    local function _6_()
      return require("cmp_nvim_lsp")
    end
    ok_3f1, cmp = pcall(_6_)
    local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
    if ok_3f1 then
      lspconfig_configs.fennel_language_server = {default_config = {cmd = {"fennel-language-server"}, filetypes = {"fennel"}, single_file_support = true, root_dir = lspconfig.util.root_pattern("fnl"), settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths()}, diagnostics = {globals = {"vim"}}}}}}
    else
    end
    lspconfig.fennel_language_server.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.lua_ls.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.elixirls.setup({cmd = {"elixir-ls"}, on_attach = custom_attach, capabilities = capabilities})
    lspconfig.erlangls.setup({on_attach = custom_attach, capabilities = capabilities})
    return lspconfig.rust_analyzer.setup({on_attach = custom_attach, capabilities = capabilities})
  else
    return nil
  end
end
return {config = config}
