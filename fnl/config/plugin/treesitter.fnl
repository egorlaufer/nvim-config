(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? treesitter) (pcall #(require :nvim-treesitter.configs))]
    (when ok?
      (treesitter.setup {:highlight {:enabled true
                                     :additional_vim_regex_highlighting false}})
      (vim.cmd "TSEnable highlight"))))

{1 :nvim-treesitter/nvim-treesitter
 :ft [:fennel :lua :rust :erlang :elixir :idris2]
 :config (lazy-config-fn config mod)
 :lazy true}

