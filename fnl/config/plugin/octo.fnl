(fn config [plugin opts]
  (let [(ok? octo) (pcall #(require :octo))]
    (when ok?
      (octo.setup {}))))

{: config}

