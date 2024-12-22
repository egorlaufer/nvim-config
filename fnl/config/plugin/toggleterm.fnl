(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? toggleterm) (pcall #(require :toggleterm))]
    (when ok?
      (toggleterm.setup {}))))

{1 :akinsho/toggleterm.nvim
 :cmd [:ToggleTerm]
 :keys [{1 :<leader><space>
         2 ":ToggleTerm<cr>"
         :mode :n
         :silent true
         :nowait true
         :desc :toggleterm}]
 :config (lazy-config-fn mod config)}
