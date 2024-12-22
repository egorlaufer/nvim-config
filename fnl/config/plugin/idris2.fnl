(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

{1 :ShinKage/idris2-nvim
 :requires [:neovim/nvim-lspconfig :MunifTanjim/nui.nvim]
 :ft [:idris2]
 :config (lazy-config-fn mod
                         (fn [_plugin opts]
                           (-?> (require :idris2)
                                (: :setup opts))))}
