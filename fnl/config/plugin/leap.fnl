(fn config [plugin opts]
  (let [(ok? leap) (pcall #(require :leap))]
    (when ok? (leap.add_default_mappings))))

{: config}
