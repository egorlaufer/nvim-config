(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? telescope) (pcall #(require :telescope))
        (_ok themes) (pcall #(require :telescope.themes))]
    (when ok?
      (telescope.setup {:defaults (vim.tbl_extend :force (themes.get_ivy)
                                                  {:path_display {:truncate 2}
                                                   :extensions {:file_browser {:hijack_netrw true}}})})
      (telescope.load_extension :zf-native)
      (telescope.load_extension :undo)
      (telescope.load_extension :file_browser)
      (telescope.load_extension :tailiscope)
      (telescope.load_extension :luasnip)
      (telescope.load_extension :undo))))

{1 :nvim-telescope/telescope.nvim
 :cmd :Telescope
 :config (lazy-config-fn config mod)
 :dependencies [[:nvim-lua/popup.nvim]
                [:nvim-lua/plenary.nvim]
                [:nvim-telescope/telescope-ui-select.nvim]
                [:nvim-telescope/telescope-dap.nvim]
                [:nvim-treesitter/nvim-treesitter]
                [:natecraddock/telescope-zf-native.nvim]
                [:debugloop/telescope-undo.nvim]
                [:nvim-telescope/telescope-file-browser.nvim]
                [:danielvolchek/tailiscope.nvim]
                [:benfowler/telescope-luasnip.nvim]
                [:debugloop/telescope-undo.nvim]
                [{1 :rachartier/tiny-code-action.nvim :opts {}}]]}
