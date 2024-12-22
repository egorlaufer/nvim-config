(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)
(set _G.vim.g.conjure#client#fennel#aniseed#deprecation_warning false)
(fn config [plugin opts]
  (let [(ok? conjure) (pcall #(require :conjure))]
    (when ok?
      (set _G.vim.g.conjure#filetype#fennel :conjure.client.fennel.stdio)
      (set _G.vim.g.conjure#extract#tree_sitter#enabled true))))

{1 :Olical/conjure
 :version "*"
 :ft [:fennel]
 :config (lazy-config-fn mod config)}
