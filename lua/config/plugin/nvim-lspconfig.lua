-- [nfnl] Compiled from fnl/config/plugin/nvim-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function custom_attach(client, bufnr)
  local function map(mode, from, to)
    local to0 = (":" .. to .. "<cr>")
    return vim.keymap.set(mode, from, to0, {buffer = bufnr, noremap = true})
  end
  local function x_map(from, to)
    return map("x", from, to)
  end
  local function n_map(from, to)
    return map("n", from, to)
  end
  local function map_fn(from, to_fn)
    return vim.keymap.set("n", from, to_fn, {buffer = bufnr, noremap = true})
  end
  map_fn("gd", (require("telescope.builtin")).lsp_definitions)
  map_fn("gD", vim.lsp.buf.declaration)
  map_fn("gr", (require("telescope.builtin")).lsp_references)
  map_fn("gI", (require("telescope.builtin")).lsp_implementations)
  map_fn("K", vim.lsp.buf.hover)
  map_fn("<c-k>", vim.lsp.buf.signature_help)
  map_fn("<c-p>", vim.diagnostic.goto_prev)
  map_fn("<c-n>", vim.diagnostic.goto_next)
  map_fn("<leader>rn", vim.lsp.buf.rename)
  map_fn("<leader>cf", vim.lsp.buf.format)
  map_fn("<leader>ca", vim.lsp.buf.code_action)
  map_fn("<leader>ds", (require("telescope.builtin")).lsp_document_symbols)
  map_fn("<leader>ws", (require("telescope.builtin")).lsp_dynamic_workspace_symbols)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifuc")
  if client.server_capabilities.document_formatting then
    n_map("<leader>F", "lua vim.lsp.buf.formatting_sync()")
  else
  end
  if client.server_capabilities.document_range_formatting then
    x_map("<leader>F", "lua vim.lsp.buf.range_formatting()")
  else
  end
  if (client.name == "omnisharp") then
    client.server_capabilities["semanticTokensProvider"] = nil
  else
  end
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {buffer = bufnr, callback = vim.lsp.buf.document_highlight})
    return vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {buffer = bufnr, callback = vim.lsp.buf.clear_references})
  else
    return nil
  end
end
local function config(plugin, opts)
  local ok_3f, lspconfig = nil, nil
  local function _5_()
    return require("lspconfig")
  end
  ok_3f, lspconfig = pcall(_5_)
  if ok_3f then
    local ok_3f0, lspconfig_configs = nil, nil
    local function _6_()
      return require("lspconfig.configs")
    end
    ok_3f0, lspconfig_configs = pcall(_6_)
    local ok_3f1, cmp = nil, nil
    local function _7_()
      return require("cmp_nvim_lsp")
    end
    ok_3f1, cmp = pcall(_7_)
    local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), cmp.default_capabilities())
    if ok_3f1 then
      lspconfig_configs.fennel_language_server = {default_config = {cmd = {"fennel-language-server"}, filetypes = {"fennel"}, single_file_support = true, root_dir = lspconfig.util.root_pattern("fnl"), settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths()}, diagnostics = {globals = {"vim"}}}}}}
    else
    end
    lspconfig.fennel_language_server.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.lua_ls.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.elixirls.setup({cmd = {"elixir-ls"}, on_attach = custom_attach, capabilities = capabilities})
    lspconfig.erlangls.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.rust_analyzer.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.tailwindcss.setup({on_attach = custom_attach, capabilities = capabilities, filetypes = {"html", "elixir", "eelixir", "heex"}, init_options = {userLanguages = {elixir = "html-eex", eelixir = "html-eex", heex = "html-eex"}}, settings = {tailwindCSS = {experimental = {classRegex = {"class[:]\\s*\"([^\"]*)\""}}}}})
    return lspconfig.ansiblels.setup({})
  else
    return nil
  end
end
return {config = config}
