{1 :kristijanhusak/vim-dadbod-ui
 :dependencies [{1 :tpope/vim-dadbod :lazy true}
                {1 :kristijanhusak/vim-dadbod-completion
                 :ft [:sql :mysql :plsql]
                 :lazy true}]
 :cmd [:DBUI :DBUIToggle :DBUIAddConnection :DBUIFindBuffer]
 :init (fn []
         (set _G.vim.g.db_ui_use_nerd_fonts 1))}
