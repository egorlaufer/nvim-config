(fn config [plugin opts]
  (let [(ok? telescope) (pcall #(require :telescope))]
    (when ok?
      (telescope.load_extension :zf-native)
      (telescope.load_extension :http)
      (telescope.load_extension :undo)
      (telescope.load_extension :http))))

{: config}

