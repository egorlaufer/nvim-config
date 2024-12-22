(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

{1 :ggandor/leap.nvim
 :event [:BufReadPost :InsertEnter]
 :config (lazy-config-fn mod
                         (fn [_plugin opts]
                           (-?> (require :leap)
                                (: :setup opts))))}
