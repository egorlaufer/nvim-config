(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

{1 :doctorfree/cheatsheet.nvim
 :cmd [:Cheatsheet :CheatsheetEdit]
 :keys [{1 :<leader>ch
         2 ":Cheatsheet<CR>"
         :mode :n
         :silent true
         :desc :Cheatsheet}]
 :opts {}
 :config (lazy-config-fn mod
                         (fn [_plugin opts]
                           (-?> (require :cheatsheet)
                                (: :setup opts))))}
