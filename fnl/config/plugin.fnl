(macro try [f]
  (let [s (tostring f)]
    `(fn []
       (let [(ok?# _res#) (pcall ,f)]
         (if ok?#
             false
             (do
               (print (.. "Failed configuring: " ,s))
               true))))))

(fn config-conjure [plugin opts]
  (let [(ok? conjure) (pcall #(require :conjure))]
    (when ok?
      (set vim.g.conjure#filetype#fennel :conjure.client.fennel.stdio)
      (set vim.g.conjure#extract#tree_sitter#enabled true))))

(fn config-nvim-lspconfig [plugin opts]
  (let [(ok? lspconfig) (pcall #(require :lspconfig))]
    (when ok?
      (let [(ok? lspconfig-configs) (pcall #(require :lspconfig.configs))]
        (when ok?
          (set lspconfig-configs.fennel_language_server
               {:default_config {:cmd [:fennel-language-server]
                                 :filetypes [:fennel]
                                 :single_file_support true
                                 :root_dir (lspconfig.util.root_pattern :fnl)
                                 :settings {:fennel {:workspace {:library (vim.api.nvim_list_runtime_paths)}
                                                     :diagnostics {:globals [:vim]}}}}})))
      (lspconfig.fennel_language_server.setup {})
      (lspconfig.lua_ls.setup {})
      (lspconfig.elixirls.setup {:cmd [:elixir-ls]})
      (lspconfig.erlangls.setup {})
      (lspconfig.rust_analyzer.setup {}))))

(fn config-rose-pine [plugin opts]
  (vim.cmd "set background=dark")
  (vim.cmd "colorscheme rose-pine-moon"))

(fn config-treesitter [plugin opts]
  (let [(ok? treesitter) (pcall #(require :nvim-treesitter.configs))]
    (when ok?
      (treesitter.setup {:highlight {:enabled true
                                     :additional_vim_regex_highlighting false}})
      (vim.cmd "TSEnable highlight"))))

(fn config-leap [plugin opts]
  (let [(ok? leap) (pcall #(require :leap))]
    (when ok? (leap.add_default_mappings))))

(fn config-cmp [plugin opts]
  (set vim.o.completeopt "menuone,noselect")
  (let [(ok? cmp) (pcall #(require :cmp))]
    (when ok?
      (cmp.setup {:sources [{:name :conjure}
                            {:name :nvim_lsp}
                            {:name :buffer}
                            {:name :path}
                            {:name :greek}
                            {:name :rg
                             :keyword_length 5
                             :option {:debounce 1000}}
                            {:name :nvim_lua}]
                  :view {:entries :native}
                  :mapping (cmp.mapping.preset.insert {:<C-b> (cmp.mapping.scroll_docs -4)
                                                       :<C-f> (cmp.mapping.scroll_docs 4)
                                                       :<C-Space> (cmp.mapping.complete)
                                                       :<C-e> (cmp.mapping.abort)
                                                       :<CR> (cmp.mapping.confirm {:select false})})})
      (cmp.setup.filetype :gitcommit
                          {:sources [{:name :cmp_git}
                                     {:name :path}
                                     {:name :buffer}
                                     {:name :rg
                                      :keyword_length 5
                                      :option {:debounce 1000}}]}))))

(fn config-format-on-save [plugin opts]
  (let [(ok1? fos) (pcall #(require :format-on-save))
        (ok2? fos-formatters) (pcall #(require :format-on-save.formatters))]
    (let [tempfile (fn [] (.. (vim.fn.expand "%") :.formatter-temp))
          fnlcmd [:fnlfmt :--fix "%"]
          fnlfmt (fos-formatters.shell {:cmd fnlcmd : tempfile})
          mixformat (fos-formatters.shell {:cmd [:mix :format "%"] : tempfile})]
      (when (and ok1? ok2?)
        (fos.setup {:exclude_path_patterns [:/node_modules/]
                    :formatter_by_ft {:fennel fnlfmt
                                      :elixir mixformat
                                      :rust fos-formatters.lsp}
                    :experiments {:partial_update :diff}})))))

(fn config-idris [plugin opts]
  (let [(ok? idris) (pcall #(require :idris2))]
    (idris.setup {})))

(let [(ok? lazy) (pcall #(require :lazy))]
  (when ok?
    (lazy.setup [{1 :Olical/nfnl :ft :fennel :lazy true}
                 {1 :Olical/conjure
                  :ft :fennel
                  :config (try config-conjure)
                  :lazy true}
                 {1 :neovim/nvim-lspconfig
                  :ft [:fennel :lua :erlang :elixir :rust :idris2]
                  :config (try config-nvim-lspconfig)
                  :dependencies [[:ray-x/lsp_signature.nvim]]
                  :lazy true}
                 {1 :rose-pine/neovim
                  :config (try config-rose-pine)
                  :lazy false}
                 {1 :ggandor/leap.nvim :config (try config-leap) :lazy false}
                 {1 :nvim-treesitter/nvim-treesitter
                  :ft [:fennel :lua :rust :erlang :elixir :idris2]
                  :config (try config-treesitter)
                  :lazy true}
                 {1 :nvim-lualine/lualine.nvim :lazy false :opts {}}
                 {1 :mbbill/undotree
                  :cmd [:UndoTreeToggle
                        :UndoTreeHide
                        :UndoTreeShow
                        :UndoTreeFocus]
                  :lazy true
                  :opts {}}
                 {1 :hrsh7th/nvim-cmp
                  :dependencies [[:PaterJason/cmp-conjure]
                                 [:hrsh7th/cmp-buffer]
                                 [:hrsh7th/cmp-cmdline]
                                 [:hrsh7th/cmp-nvim-lsp]
                                 [:hrsh7th/cmp-path]
                                 [:hrsh7th/cmp-omni]
                                 [:hrsh7th/cmp-nvim-lua]]
                  :config (try config-cmp)
                  :lazy false}
                 {1 :elentok/format-on-save.nvim
                  :config (try config-format-on-save)
                  :lazy false}
                 {1 :folke/which-key.nvim :lazy false :opts {}}
                 {1 :nvim-telescope/telescope.nvim
                  :cmd :Telescope
                  :dependencies [[:nvim-lua/popup.nvim]
                                 [:nvim-lua/plenary.nvim]
                                 [:nvim-telescope/telescope-symbols.nvim]
                                 [:nvim-telescope/telescope-ui-select.nvim]
                                 [:barrett-ruth/telescope-http.nvim]
                                 [:danielvolchek/tailiscope.nvim]
                                 [:nvim-telescope/telescope-dap.nvim]
                                 [:nvim-treesitter/nvim-treesitter]]}
                 {1 "https://gitlab.com/HiPhish/rainbow-delimiters.nvim"
                  :lazy false}
                 {1 :tpope/vim-commentary}
                 {1 :tpope/vim-fugitive}
                 {1 :tpope/vim-surround}
                 {1 :NMAC427/guess-indent.nvim :lazy false}
                 {1 :jdhao/whitespace.nvim :lazy false}
                 {1 :kyazdani42/nvim-tree.lua
                  :cmd [:NvimTreeToggle
                        :NvimTreeClipboard
                        :NvimTreeClose
                        :NvimTreeCollapse
                        :NvimTreeCollapseKeepBuffers
                        :NvimTreeFindFile
                        :NvimTreeFindFileToggle
                        :NvimTreeFocus
                        :NvimTreeOpen
                        :NvimTreeRefresh
                        :NvimTreeResize
                        :NvimTreeToggle]
                  :lazy true
                  :opts {}}
                 {1 :mfussenegger/nvim-dap}
                 {1 :rcarriga/nvim-dap-ui}
                 {1 :simrat39/rust-tools.nvim
                  :dependencies [[:nvim-lua/plenary.nvim]]}
                 {1 :akinsho/toggleterm.nvim :cmd [:ToggleTerm]}
                 {1 :rose-pine/neovim :lazy false}
                 {1 :terryma/vim-expand-region :lazy false}
                 {1 :MunifTanjim/nui.nvim :lazy false}
                 {1 :ShinKage/idris2-nvim
                  :requires [:neovim/nvim-lspconfig :MunifTanjim/nui.nvim]
                  :ft [:idris2]
                  :config (try config-idris)}])))
