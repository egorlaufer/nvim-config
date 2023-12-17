(fn config [plugin opts]
  (let [(ok1? fos) (pcall #(require :format-on-save))
        (ok2? fos-formatters) (pcall #(require :format-on-save.formatters))]
    (let [tempfile (fn [] (.. (vim.fn.expand "%") :.formatter-temp))
          fnlcmd [:fnlfmt :--fix "%"]
          fnlfmt (fos-formatters.shell {:cmd fnlcmd : tempfile})
          mixformat (fos-formatters.shell {:cmd [:mix :format "%"] : tempfile})]
      (when (and ok1? ok2?)
        (fos.setup {:exclude_path_patterns [:/node_modules/]
                    :formatter_by_ft {:fennel fnlfmt
                                      :elixir mixformat
                                      :rust fos-formatters.lsp}
                    :experiments {:partial_update :diff}})))))

{: config}
