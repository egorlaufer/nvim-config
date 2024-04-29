-- [nfnl] Compiled from fnl/config/plugin/nvim-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local util = require("config.util")
local mod = ...
local lexical_bin = "start_lexical.sh"
local function custom_attach(client, bufnr)
  util["set-normal-telescope"]("gd", "lsp_definitions", {buffer = bufnr})
  util["set-normal-telescope"]("gD", "lsp_type_definitions", {buffer = bufnr})
  util["set-normal-telescope"]("gr", "lsp_references", {buffer = bufnr})
  util["set-normal-telescope"]("gI", "lsp_implementations", {buffer = bufnr})
  util["set-normal-telescope"]("<leader>ds", "lsp_document_symbols", {buffer = bufnr})
  util["set-normal-telescope"]("<leader>ws", "lsp_dynamic_workspace_symbols", {buffer = bufnr})
  util["set-normal"]("K", vim.lsp.buf.hover, {desc = "vim.lsp.buf.hover", buffer = bufnr})
  util["set-normal"]("<c-k>", vim.lsp.buf.signature_help, {desc = "vim.lsp.buf.signature_help", buffer = bufnr})
  util["set-normal"]("<c-p>", vim.diagnostic.goto_prev, {desc = "vim.diagnostic.goto_prev", buffer = bufnr})
  util["set-normal"]("<c-n>", vim.diagnostic.goto_next, {desc = "vim.diagnostic.goto_next", buffer = bufnr})
  util["set-normal"]("<leader>rn", vim.lsp.buf.rename, {desc = "vim.lsp.buf.rename", buffer = bufnr})
  util["set-normal"]("<leader>cf", vim.lsp.buf.format, {desc = "vim.lsp.buf.format", buffer = bufnr})
  util["set-normal"]("<leader>ca", vim.lsp.buf.code_action, {desc = "vim.lsp.buf.code_action", buffer = bufnr})
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifuc")
  if client.server_capabilities.document_formatting then
    util["set-normal"]("<leader>F", vim.lsp.buf.formatting_sync, {desc = "vim.lsp.buf.formatting_sync", buffer = bufnr})
  else
  end
  if client.server_capabilities.document_range_formatting then
    util["set-visual"]("<leader>F", vim.lsp.buf.range_formatting, {desc = "vim.lsp.buf.range_formatting", buffer = bufnr})
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
    if not lspconfig_configs.lexical then
      local function _8_(fname)
        return (lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir())
      end
      lspconfig_configs["lexical"] = {default_config = {filetypes = {"elixir", "eelixr", "heex"}, cmd = {lexical_bin}, root_dir = _8_, settings = {}}}
    else
    end
    lspconfig.fennel_ls.setup({on_attach = custom_attach, capabilities = capabilities, settings = {["fennel-ls"] = {["extra-globals"] = "vim"}}})
    lspconfig.lua_ls.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.lexical.setup({})
    lspconfig.erlangls.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.rust_analyzer.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.tailwindcss.setup({on_attach = custom_attach, capabilities = capabilities, filetypes = {"html", "elixir", "eelixir", "heex"}, init_options = {userLanguages = {elixir = "html-eex", eelixir = "html-eex", heex = "html-eex"}}, settings = {tailwindCSS = {experimental = {classRegex = {"class[:]\\s*\"([^\"]*)\""}}}}})
    return lspconfig.ansiblels.setup({})
  else
    return nil
  end
end
local function _11_(plugin_12_auto, opts_13_auto)
  local start_14_auto = vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _12_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_12_)
  local ok_3f_17_auto, res_18_auto = pcall(config, plugin_12_auto, opts_13_auto)
  if ok_3f_17_auto then
    if fidget_3f_15_auto then
      local ms_19_auto = ((vim.loop.hrtime() - start_14_auto) / 1000000)
      fidget_16_auto.notify((mod .. " in " .. ms_19_auto .. "ms"))
    else
    end
    return true
  else
    if fidget_3f_15_auto then
      fidget_16_auto.notify(("Failed configuring: " .. mod .. res_18_auto))
    else
      print(("Failed configuring: " .. mod .. res_18_auto))
    end
    return false
  end
end
return {"neovim/nvim-lspconfig", ft = {"fennel", "lua", "erlang", "elixir", "rust", "idris2"}, config = _11_, dependencies = {{"ray-x/lsp_signature.nvim"}}, lazy = true}
