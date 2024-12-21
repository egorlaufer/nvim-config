(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [_plugin _opts]
  ((. (require :nvim-surround) :setup) {}))

{1 :kylechui/nvim-surround
 :version "*"
 :event :VeryLazy
 :config (lazy-config-fn config mod)}
