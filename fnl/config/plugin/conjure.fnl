(fn config [plugin opts]
  (let [(ok? conjure) (pcall #(require :conjure))]
    (when ok?
      (set vim.g.conjure#filetype#fennel :conjure.client.fennel.stdio)
      (set vim.g.conjure#extract#tree_sitter#enabled true))))

{: config}
