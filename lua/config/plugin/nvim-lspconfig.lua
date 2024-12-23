-- [nfnl] Compiled from fnl/config/plugin/nvim-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local util = require("config.util")
local mod = ...
local lexical_bin = "start_lexical.sh"
local omnisharp_token_types = {"comment", "excluded_code", "identifier", "keyword", "keyword_control", "number", "operator", "operator_overloaded", "preprocessor_keyword", "string", "whitespace", "text", "static_symbol", "preprocessor_text", "punctuation", "string_verbatim", "string_escape_character", "class_name", "delegate_name", "enum_name", "interface_name", "module_name", "struct_name", "type_parameter_name", "field_name", "enum_member_name", "constant_name", "local_name", "parameter_name", "method_name", "extension_method_name", "property_name", "event_name", "namespace_name", "label_name", "xml_doc_comment_attribute_name", "xml_doc_comment_attribute_quotes", "xml_doc_comment_attribute_value", "xml_doc_comment_cdata_section", "xml_doc_comment_comment", "xml_doc_comment_delimiter", "xml_doc_comment_entity_reference", "xml_doc_comment_name", "xml_doc_comment_processing_instruction", "xml_doc_comment_text", "xml_literal_attribute_name", "xml_literal_attribute_quotes", "xml_literal_attribute_value", "xml_literal_cdata_section", "xml_literal_comment", "xml_literal_delimiter", "xml_literal_embedded_expression", "xml_literal_entity_reference", "xml_literal_name", "xml_literal_processing_instruction", "xml_literal_text", "regex_comment", "regex_character_class", "regex_anchor", "regex_quantifier", "regex_grouping", "regex_alternation", "regex_text", "regex_self_escaped_character", "regex_other_escape"}
local function omnisharp_capabilities(capabilities)
  return _G.vim.tbl_deep_extend("force", capabilities, {semanticTokensProvider = {full = _G.vim.empty_dict(), legend = {tokenModifiers = {"static_symbol"}, tokenTypes = omnisharp_token_types}, range = true}})
end
local function custom_attach(client, bufnr)
  util["set-normal-telescope"]("gd", "lsp_definitions", {buffer = bufnr})
  util["set-normal-telescope"]("gD", "lsp_type_definitions", {buffer = bufnr})
  util["set-normal-telescope"]("gr", "lsp_references", {buffer = bufnr})
  util["set-normal-telescope"]("gI", "lsp_implementations", {buffer = bufnr})
  util["set-normal-telescope"]("<leader>ws", "lsp_dynamic_workspace_symbols", {buffer = bufnr})
  util["set-normal"]("K", _G.vim.lsp.buf.hover, {desc = "vim.lsp.buf.hover", buffer = bufnr})
  util["set-normal"]("<c-k>", _G.vim.lsp.buf.signature_help, {desc = "vim.lsp.buf.signature_help", buffer = bufnr})
  util["set-normal"]("<c-p>", _G.vim.diagnostic.goto_prev, {desc = "vim.diagnostic.goto_prev", buffer = bufnr})
  util["set-normal"]("<c-n>", _G.vim.diagnostic.goto_next, {desc = "vim.diagnostic.goto_next", buffer = bufnr})
  util["set-normal"]("<leader>rn", _G.vim.lsp.buf.rename, {desc = "vim.lsp.buf.rename", buffer = bufnr})
  util["set-normal"]("<leader>cf", _G.vim.lsp.buf.format, {desc = "vim.lsp.buf.format", buffer = bufnr})
  util["set-normal"]("<leader>ca", _G.vim.lsp.buf.code_action, {desc = "vim.lsp.buf.code_action", buffer = bufnr})
  do
    local ok_3f, tca = nil, nil
    local function _1_()
      return require("tiny-code-action")
    end
    ok_3f, tca = pcall(_1_)
    if ok_3f then
      util["set-normal"]("<leader>ca", tca.code_action, {desc = "vim.lsp.buf.code_action", buffer = bufnr})
    else
    end
  end
  _G.vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifuc")
  if client.server_capabilities.document_formatting then
    util["set-normal"]("<leader>F", _G.vim.lsp.buf.formatting_sync, {desc = "vim.lsp.buf.formatting_sync", buffer = bufnr})
  else
  end
  if client.server_capabilities.document_range_formatting then
    util["set-visual"]("<leader>F", _G.vim.lsp.buf.range_formatting, {desc = "vim.lsp.buf.range_formatting", buffer = bufnr})
  else
  end
  if (client.name == "omnisharp") then
    client.server_capabilities["semanticTokensProvider"] = nil
  else
  end
  if client.server_capabilities.documentHighlightProvider then
    _G.vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {buffer = bufnr, callback = _G.vim.lsp.buf.document_highlight})
    return _G.vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {buffer = bufnr, callback = _G.vim.lsp.buf.clear_references})
  else
    return nil
  end
end
local function config(_plugin, _opts)
  local ok_3f, lspconfig = nil, nil
  local function _7_()
    return require("lspconfig")
  end
  ok_3f, lspconfig = pcall(_7_)
  if ok_3f then
    local ok_3f0, lspconfig_configs = nil, nil
    local function _8_()
      return require("lspconfig.configs")
    end
    ok_3f0, lspconfig_configs = pcall(_8_)
    local ok_3f1, cmp = nil, nil
    local function _9_()
      return require("cmp_nvim_lsp")
    end
    ok_3f1, cmp = pcall(_9_)
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    if not lspconfig_configs.lexical then
      local function _10_(fname)
        return (lspconfig.util.root_pattern("mix.exs", ".git")(fname) or _G.vim.loop.os_homedir())
      end
      lspconfig_configs.lexical = {default_config = {cmd = {lexical_bin}, filetypes = {"elixir", "eelixr", "heex"}, root_dir = _10_, settings = {}}}
    else
    end
    lspconfig.fennel_ls.setup({on_attach = custom_attach, capabilities = capabilities, settings = {["fennel-ls"] = {["extra-globals"] = "vim"}}})
    lspconfig.lua_ls.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.lexical.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.erlangls.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.rust_analyzer.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.tailwindcss.setup({on_attach = custom_attach, capabilities = capabilities, filetypes = {"html", "elixir", "eelixir", "heex"}, init_options = {userLanguages = {elixir = "html-eex", eelixir = "html-eex", heex = "html-eex"}}, settings = {tailwindCSS = {experimental = {classRegex = {"class[:]\\s*\"([^\"]*)\""}}}}})
    lspconfig.ansiblels.setup({on_attach = custom_attach, capabilities = capabilities})
    lspconfig.zls.setup({on_attach = custom_attach, capabilities = capabilities})
    return lspconfig.omnisharp.setup({cmd = {"omnisharp"}, root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"), on_attach = custom_attach, capabilities = omnisharp_capabilities(capabilities)})
  else
    return nil
  end
end
local function _13_(plugin_12_auto, opts_13_auto)
  local start_14_auto = _G.vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _14_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_14_)
  local ok_3f_17_auto, res_18_auto = pcall(config, plugin_12_auto, opts_13_auto)
  if ok_3f_17_auto then
    if fidget_3f_15_auto then
      local ms_19_auto = ((_G.vim.loop.hrtime() - start_14_auto) / 1000000)
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
return {"neovim/nvim-lspconfig", ft = {"fennel", "lua", "erlang", "elixir", "rust", "idris2", "cs", "zig"}, config = _13_, version = "*", lazy = true, dependencies = {require("config.plugin.blink"), {"williamboman/mason-lspconfig.nvim", opts = {}, dependencies = {{"williamboman/mason.nvim", cmd = {"Mason", "MasonUpdate", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog"}, opts = {}}}}, {"ray-x/lsp_signature.nvim"}}}
