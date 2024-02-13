(fn config [plugin opts]
  (let [(ok? con) (pcall #(require :conform))]
    (when ok?
      (con.setup {:formatters_by_ft {:fennel [:fnlfmt]
                                     :elixir [:mix]
                                     :rust [:rustfmt]}
                  :format_on_save {:timeout_ms 2000 :lsp_fallback true}}))))

{: config}

