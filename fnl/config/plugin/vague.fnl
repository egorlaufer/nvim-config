(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (-?> (require :vague) (: :setup opts))
  (vim.cmd "set background=dark")
  (vim.cmd "colorscheme vague"))

{1 :vague2k/vague.nvim :lazy false :config (lazy-config-fn mod config)}
