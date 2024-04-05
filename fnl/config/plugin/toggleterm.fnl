(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? toggleterm) (pcall #(require :toggleterm))]
    (when ok?
      (toggleterm.setup {}))))

{1 :akinsho/toggleterm.nvim
 :cmd [:ToggleTerm]
 :config (lazy-config-fn config mod)}

