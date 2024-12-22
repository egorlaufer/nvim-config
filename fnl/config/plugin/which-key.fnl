(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? which-key) (pcall #(require :which-key))]
    (when ok?
      (which-key.setup opts))))

{1 :folke/which-key.nvim
 :version "*"
 :lazy false
 :config (lazy-config-fn mod config)}
