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
 :config (lazy-config-fn mod config)
 :opts {:theme_light :auto :theme_dark :auto}
 :event :VeryLazy}
