-- [nfnl] Compiled from fnl/config/plugin/conform.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, con = nil, nil
  local function _1_()
    return require("conform")
  end
  ok_3f, con = pcall(_1_)
  if ok_3f then
    return con.setup({formatters_by_ft = {fennel = {"fnlfmt"}, elixir = {"mix"}, rust = {"rustfmt"}}, format_on_save = {timeout_ms = 2000, lsp_fallback = true}})
  else
    return nil
  end
end
return {config = config}
