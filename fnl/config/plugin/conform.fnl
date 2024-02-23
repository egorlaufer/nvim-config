(fn config [plugin opts]
  (let [(ok? con) (pcall #(require :conform))]
    (when ok?
      (con.setup {:formatters {:rebar3_fmt {:command "rebar3 fmt"}}
                  :formatters_by_ft {:fennel [:fnlfmt]
                                     :elixir [:mix]
                                     :rust [:rustfmt]
                                     :erlang [:rebar3_fmt]}
                  :format_on_save {:timeout_ms 2000 :lsp_fallback false}}))))

{: config}

