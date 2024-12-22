-- [nfnl] Compiled from fnl/config/plugin/dadbod.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  _G.vim.g.db_ui_use_nerd_fonts = 1
  return nil
end
return {"kristijanhusak/vim-dadbod-ui", dependencies = {{"tpope/vim-dadbod", lazy = true}, {"kristijanhusak/vim-dadbod-completion", ft = {"sql", "mysql", "plsql"}, lazy = true}}, cmd = {"DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer"}, init = _1_}
