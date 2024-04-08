(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (vim.cmd "set background=dark")
  (vim.cmd "colorscheme melange"))

{1 :savq/melange-nvim :lazy false :config (lazy-config-fn config mod)}

