(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? treesitter) (pcall #(require :nvim-treesitter.configs))]
    (when ok?
      (treesitter.setup {:highlight {:enabled true
                                     :additional_vim_regex_highlighting false}})
      (_G.vim.cmd "TSEnable highlight")
      (_G.vim.cmd "TSEnable indent")
      (_G.vim.cmd "TSEnable incremental_selection"))))

{1 :nvim-treesitter/nvim-treesitter
 :ft [:fennel :lua :rust :erlang :elixir :idris2]
 :config (lazy-config-fn mod config)
 :lazy true}
