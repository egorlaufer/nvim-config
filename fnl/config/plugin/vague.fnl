(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (-?> (require :vague) (: :setup opts))
  (_G.vim.cmd "set background=dark")
  (_G.vim.cmd "colorscheme vague"))

{1 :vague2k/vague.nvim :lazy false :config (lazy-config-fn mod config)}
