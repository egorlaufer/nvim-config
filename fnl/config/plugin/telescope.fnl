(fn config [plugin opts]
  (let [(ok? telescope) (pcall #(require :telescope))
        (_ok themes) (pcall #(require :telescope.themes))]
    (when ok?
      (telescope.setup {:defaults (vim.tbl_extend :force (themes.get_ivy)
                                                  {:path_display {:truncate 2}
                                                   :extensions {:file_browser {:hijack_netrw true}}})})
      (telescope.load_extension :zf-native)
      (telescope.load_extension :http)
      (telescope.load_extension :undo)
      (telescope.load_extension :http)
      (telescope.load_extension :file_browser)
      (telescope.load_extension :tailiscope)
      (telescope.load_extension :luasnip)
      (telescope.load_extension :undo))))

{: config}

