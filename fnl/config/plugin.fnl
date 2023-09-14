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
      (set vim.g.conjure#filetype#fennel :conjure.client.fennel.stdio))))

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
      (lspconfig.elixirls.setup {})
      (lspconfig.erlangls.setup {}))))

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
  (let [symbols-map [{:word ":alpha"
                      :label "α alpha"
                      :insertText "α"
                      :filterText ":alpha"}
                     {:word ":Alpha"
                      :label "Α Alpha"
                      :insertText "α"
                      :filterText ":Alpha"}
                     {:word ":beta"
                      :label "β beta"
                      :insertText "β"
                      :filterText ":beta"}
                     {:word ":Beta"
                      :label "Β Beta"
                      :insertText "Β"
                      :filterText ":Beta"}
                     {:word ":gamma"
                      :label "γ gamma"
                      :insertText "γ"
                      :filterText ":gamma"}
                     {:word ":Gamma"
                      :label "Γ Gamma"
                      :inertText "Γ"
                      :filterText ":Gamma"}
                     {:word ":delta"
                      :label "δ delta"
                      :insertText "δ"
                      :filterText ":delta"}
                     {:word ":Delta"
                      :label "Δ Delta"
                      :insertText "Δ"
                      :filterText ":Delta"}
                     {:word ":epsilon"
                      :label "ε epsilon"
                      :insertText "ε"
                      :filterText ":epsilon"}
                     {:word ":Epsilon"
                      :label "Ε Epsilon"
                      :insertText "Ε"
                      :filterText ":Epsilon"}
                     {:word ":zeta"
                      :label "ζ zeta"
                      :insertText "ζ"
                      :filterText ":zeta"}
                     {:word ":Zeta"
                      :label "Ζ Zeta"
                      :insertText "Ζ"
                      :filterText ":Zeta"}
                     {:word ":eta"
                      :label "η eta"
                      :insertText "η"
                      :filterText ":eta"}
                     {:word ":Eta"
                      :label "Η Eta"
                      :insertText "Η"
                      :filterText ":Eta"}
                     {:word ":theta"
                      :label "θ theta"
                      :insertText "θ"
                      :filterText ":theta"}
                     {:word ":Theta"
                      :label "Θ Theta"
                      :insertText "Θ"
                      :filterText ":Theta"}
                     {:word ":iota"
                      :label "ι iota"
                      :insertText "ι"
                      :filterText ":iota"}
                     {:word ":Iota"
                      :label "Ι Iota"
                      :insertText "Ι"
                      :filterText ":Iota"}
                     {:word ":kappa"
                      :label "κ kappa"
                      :insertText "κ"
                      :filterText ":kappa"}
                     {:word ":Kappa"
                      :label "Κ Kappa"
                      :insertText "Κ"
                      :filterText ":Kappa"}
                     {:word ":lambda"
                      :label "λ lambda"
                      :insertText "λ"
                      :filterText ":lambda"}
                     {:word ":Lambda"
                      :label "Λ Lambda"
                      :insertText "Λ"
                      :filterText ":Lambda"}
                     {:word ":mu"
                      :label "μ mu"
                      :insertText "μ"
                      :filterText ":mu"}
                     {:word ":Mu"
                      :label "Μ Mu"
                      :insertText "Μ"
                      :filterText ":Mu"}
                     {:word ":nu"
                      :label "ν nu"
                      :insertText "ν"
                      :filterText ":nu"}
                     {:word ":Nu"
                      :label "Ν Nu"
                      :insertText "Ν"
                      :filterText ":Nu"}
                     {:word ":xi"
                      :label "ξ xi"
                      :insertText "ξ"
                      :filterText ":xi"}
                     {:word ":Xi"
                      :label "Ξ Xi"
                      :insertText "Ξ"
                      :filterText ":Xi"}
                     {:word ":omicron"
                      :label "ο omicron"
                      :insertText "ο"
                      :filterText ":omicron"}
                     {:word ":Omicron"
                      :label "Ο Omicron"
                      :insertText "Ο"
                      :filterText ":Omicron"}
                     {:word ":pi"
                      :label "π pi"
                      :insertText "π"
                      :filterText ":pi"}
                     {:word ":Pi"
                      :label "Π Pi"
                      :insertText "Π"
                      :filterText ":Pi"}
                     {:word ":rho"
                      :label "ρ rho"
                      :insertText "ρ"
                      :filterText ":rho"}
                     {:word ":Rho"
                      :label "Ρ Rho"
                      :insertText "Ρ"
                      :filterText ":Rho"}
                     {:word ":sigma"
                      :label "σ sigma"
                      :insertText "σ"
                      :filterText ":sigma"}
                     {:word ":Sigma"
                      :label "Σ Sigma"
                      :insertText "Σ"
                      :filterText ":Sigma"}
                     {:word ":tau"
                      :label "τ tau"
                      :insertText "τ"
                      :filterText ":tau"}
                     {:word ":Tau"
                      :label "Τ Tau"
                      :insertText "Τ"
                      :filterText ":Tau"}
                     {:word ":upsilon"
                      :label "υ upsilon"
                      :insertText "υ"
                      :filterText ":upsilon"}
                     {:word ":Upsilon"
                      :label "Υ Upsilon"
                      :insertText "Υ"
                      :filterText ":Upsilon"}
                     {:word ":phi"
                      :label "Φ phi"
                      :insertText "Φ"
                      :filterText ":phi"}
                     {:word ":Phi"
                      :label "Φ Phi"
                      :insertText "Φ"
                      :filterText ":Phi"}
                     {:word ":chi"
                      :label "χ chi"
                      :insertText "χ"
                      :filterText ":chi"}
                     {:word ":Chi"
                      :label "Χ Chi"
                      :insertText "Χ"
                      :filterText ":Chi"}
                     {:word ":psi"
                      :label "ψ psi"
                      :insertText "ψ"
                      :filterText ":psi"}
                     {:word ":Psi"
                      :label "Ψ Psi"
                      :insertText "Ψ"
                      :filterText ":Psi"}
                     {:word ":omega"
                      :label "ω omega"
                      :insertText "ω"
                      :filterText ":omega"}
                     {:word ":Omega"
                      :label "Ω Omega"
                      :insertText "Ω"
                      :filterText "Omega:"}
                     {:word ":lozenge"
                      :label "◊ lozenge"
                      :insertText "◊"
                      :filterText ":lozenge"}]
        greek-source-option (fn [_ params]
                              (let [params (if params params {:option {}})]
                                (vim.tbl_extend :force {:insert false}
                                                (. params :option))))
        greek-source-trigger (fn [] [":"])
        greek-source-complete (fn [self params callback]
                                (let [params (if params params {})]
                                  (if (. ((. self :option) params) :insert)
                                      (do
                                        (if (not (. self :insert_items))
                                            (tset self :insert_items
                                                  (vim.tbl_map (fn [item]
                                                                 (tset item
                                                                       :word nil)
                                                                 item)
                                                               symbols-map)))
                                        (callback (. self :insert_items)))
                                      (do
                                        (if (not (. self :commit_items))
                                            (tset self :commit_items
                                                  symbols-map))
                                        (callback (. self :commit_items))))))
        greek-source ((fn greek-source-new []
                        {:option greek-source-option
                         :get_trigger_characters greek-source-trigger
                         :complete greek-source-complete
                         :commit_items nil
                         :insert_items nil
                         :new greek-source-new}))]
    (let [(ok? cmp) (pcall #(require :cmp))]
      (when ok?
        (cmp.register_source :greek greek-source)
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
                                        :option {:debounce 1000}}]})))))

(fn config-format-on-save [plugin opts]
  (let [(ok1? fos) (pcall #(require :format-on-save))
        (ok2? fos-formatters) (pcall #(require :format-on-save.formatters))]
    (let [tempfile (fn [] (.. (vim.fn.expand "%") :.formatter-temp))
          fnlcmd [:fnlfmt :--fix "%"]
          fnlfmt (fos-formatters.shell {:cmd fnlcmd : tempfile})]
      (when (and ok1? ok2?)
        (fos.setup {:exclude_path_patterns [:/node_modules/]
                    :formatter_by_ft {:fennel fnlfmt}
                    :experiments {:partial_update :diff}})))))

(let [(ok? lazy) (pcall #(require :lazy))]
  (when ok?
    (lazy.setup [{1 :Olical/nfnl :ft :fennel :lazy true}
                 {1 :Olical/conjure
                  :ft :fennel
                  :config (try config-conjure)
                  :lazy true}
                 {1 :neovim/nvim-lspconfig
                  :ft [:fennel :lua]
                  :config (try config-nvim-lspconfig)
                  :dependencies [[:ray-x/lsp_signature.nvim]]
                  :lazy true}
                 {1 :rose-pine/neovim
                  :config (try config-rose-pine)
                  :lazy false}
                 {1 :ggandor/leap.nvim :config (try config-leap) :lazy false}
                 {1 :nvim-treesitter/nvim-treesitter
                  :ft [:fennel :lua]
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
                 {1 :akinsho/toggleterm.nvim}
                 {1 :rose-pine/neovim :lazy false}
                 {1 :terryma/vim-expand-region}])))
