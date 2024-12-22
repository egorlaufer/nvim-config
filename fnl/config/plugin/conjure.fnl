(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)
(set vim.g.conjure#client#fennel#aniseed#deprecation_warning false)
(fn config [plugin opts]
  (let [(ok? conjure) (pcall #(require :conjure))]
    (when ok?
      (set vim.g.conjure#filetype#fennel :conjure.client.fennel.stdio)
      (set vim.g.conjure#extract#tree_sitter#enabled true))))

{1 :Olical/conjure :ft [:fennel] :config (lazy-config-fn mod config)}
