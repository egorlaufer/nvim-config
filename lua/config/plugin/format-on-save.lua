-- [nfnl] Compiled from fnl/config/plugin/format-on-save.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok1_3f, fos = nil, nil
  local function _1_()
    return require("format-on-save")
  end
  ok1_3f, fos = pcall(_1_)
  local ok2_3f, fos_formatters = nil, nil
  local function _2_()
    return require("format-on-save.formatters")
  end
  ok2_3f, fos_formatters = pcall(_2_)
  local tempfile
  local function _3_()
    return (vim.fn.expand("%") .. ".formatter-temp")
  end
  tempfile = _3_
  local fnlcmd = {"fnlfmt", "--fix", "%"}
  local fnlfmt = fos_formatters.shell({cmd = fnlcmd, tempfile = tempfile})
  local mixformat = fos_formatters.shell({cmd = {"mix", "format", "%"}, tempfile = tempfile})
  if (ok1_3f and ok2_3f) then
    return fos.setup({exclude_path_patterns = {"/node_modules/"}, formatter_by_ft = {fennel = fnlfmt, elixir = mixformat, rust = fos_formatters.lsp}, experiments = {partial_update = "diff"}})
  else
    return nil
  end
end
return {config = config}
