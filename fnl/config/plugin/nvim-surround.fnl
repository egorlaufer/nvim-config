(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [_plugin _opts]
  (-?> (require :nvim-surround)
       (: :setup {})))

{1 :kylechui/nvim-surround
 :version "*"
 :event :BufEnter
 :config (lazy-config-fn mod config)}
