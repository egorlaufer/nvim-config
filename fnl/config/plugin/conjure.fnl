(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? conjure) (pcall #(require :conjure))]
    (when ok?
      (set vim.g.conjure#filetype#fennel :conjure.client.fennel.stdio)
      (set vim.g.conjure#extract#tree_sitter#enabled true))))

{1 :Olical/conjure
 :ft [:fennel :clojure :lisp]
 :config (lazy-config-fn config mod)
 :lazy true}

