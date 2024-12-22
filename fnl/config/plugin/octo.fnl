(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

{1 :pwntester/octo.nvim
 :cmd :Octo
 :dependencies [[:nvim-lua/plenary.nvim]
                [:nvim-tree/nvim-web-devicons]
                (require :config.plugin.telescope)]
 :opts {}
 :config (lazy-config-fn mod
                         (fn [_plugin opts]
                           (-?> (require :octo)
                                (: :setup opts))))}
