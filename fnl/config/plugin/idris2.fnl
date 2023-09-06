(fn config [plugin opts]
  (let [(ok? idris) (pcall #(require :idris2))]
    (idris.setup {})))

{: config}
