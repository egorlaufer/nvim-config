(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? con) (pcall #(require :conform))]
    (when ok?
      (con.setup {:formatters {:rebar3_fmt {:command "rebar3 fmt"}}
                  :formatters_by_ft {:fennel [:fnlfmt]
                                     :elixir [:mix]
                                     :rust [:rustfmt]
                                     :erlang [:rebar3_fmt]
                                     :zig [:zigfmt]}
                  :format_on_save {:timeout_ms 2000 :lsp_fallback false}}))))

{1 :stevearc/conform.nvim
 :version "*"
 :config (lazy-config-fn mod config)
 :ft [:fennel :elixir :rust :erlang :zig]}
