-- [nfnl] Compiled from fnl/config/plugin/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function config(plugin, opts)
  local ok_3f, treesitter = nil, nil
  local function _1_()
    return require("nvim-treesitter.configs")
  end
  ok_3f, treesitter = pcall(_1_)
  if ok_3f then
    treesitter.setup({highlight = {enabled = true, additional_vim_regex_highlighting = false}})
    return vim.cmd("TSEnable highlight")
  else
    return nil
  end
end
return {config = config}
