(fn config [plugin opts]
  (let [(ok? toggleterm) (pcall #(require :toggleterm))]
    (when ok?
      (toggleterm.setup {}))))

{: config}

