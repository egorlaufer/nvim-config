(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? idris) (pcall #(require :idris2))]
    (idris.setup {})))

{1 :ShinKage/idris2-nvim
 :requires [:neovim/nvim-lspconfig :MunifTanjim/nui.nvim]
 :ft [:idris2]
 :config (lazy-config-fn config mod)}

