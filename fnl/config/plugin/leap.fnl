(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? leap) (pcall #(require :leap))]
    (when ok? (leap.add_default_mappings))))

{1 :ggandor/leap.nvim :config (lazy-config-fn config mod) :lazy false}

