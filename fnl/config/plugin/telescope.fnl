(fn config [plugin opts]
  (let [(ok? telescope) (pcall #(require :telescope))]
    (when ok?
      (telescope.setup {:defaults {:path_display {:truncate 2}
                                   :theme :ivy
                                   :extensions {:file_browser {:theme :ivy
                                                               :hijack_netrw true}}}})
      (telescope.load_extension :zf-native)
      (telescope.load_extension :http)
      (telescope.load_extension :undo)
      (telescope.load_extension :http)
      (telescope.load_extension :file_browser))))

{: config}

