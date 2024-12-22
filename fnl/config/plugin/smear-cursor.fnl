(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

{1 :sphamba/smear-cursor.nvim
 :event :VeryLazy
 :opts {}
 :config (lazy-config-fn mod
                         (fn [_plugin opts]
                           (when (= 0 (_G.vim.fn.exists "g:neovide"))
                             (-?> (require :smear_cursor)
                                  (: :setup opts))
                             (-?> (require :smear_cursor)
                                  (: :toggle)))))}
