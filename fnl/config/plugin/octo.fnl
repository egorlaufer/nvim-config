(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? octo) (pcall #(require :octo))]
    (when ok?
      (octo.setup {}))))

{1 :pwntester/octo.nvim
 :config (lazy-config-fn config mod)
 :dependencies [[:nvim-tree/nvim-web-devicons]
                [:nvim-lua/plenary.nvim]
                [:nvim-telescope/telescope.nvim]]}

