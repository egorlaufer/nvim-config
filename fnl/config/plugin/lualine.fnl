(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? lualine) (pcall #(require :lualine))]
    (when ok?
      (let [theme (if (not= 0 (vim.fn.exists "g:neovide"))
                      opts.theme_light
                      opts.theme_dark)]
        (lualine.setup {:options {: theme}})))))

{1 :nvim-lualine/lualine.nvim
 :config (lazy-config-fn config mod)
 :opts {:theme_light :melange :theme_dark :melange}
 :lazy false}

