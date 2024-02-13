(fn config [plugin opts]
  (let [(ok? lualine) (pcall #(require :lualine))]
    (when ok?
      (let [theme (if (not= 0 (vim.fn.exists "g:neovide"))
                      opts.theme_light
                      opts.theme_dark)]
        (lualine.setup {:options {: theme}})))))

{: config}

