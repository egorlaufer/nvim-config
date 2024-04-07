(import-macros {: mod} :config.init-macros)

(let [(ok? lazy) (pcall #(require :lazy))]
  (when ok?
    (lazy.setup [{1 :Olical/nfnl :ft :fennel :lazy false}
                 {1 :j-hui/fidget.nvim
                  :lazy false
                  :opts {:progress {:poll_rate 10
                                    :lsp {:progress_ringbuf_size 2048
                                          :log_handler true}}
                         :notification {:poll_rate 10
                                        :override_vim_notify true}}}
                 (require :config.plugin.conjure)
                 (require :config.plugin.nvim-lspconfig)
                 (require :config.plugin.leap)
                 (require :config.plugin.treesitter)
                 (require :config.plugin.lualine)
                 {1 :mbbill/undotree
                  :cmd [:UndotreeToggle
                        :UndotreeHide
                        :UndotreeShow
                        :UndotreeFocus]
                  :lazy true
                  :config (mod :config.plugin.undotree)
                  :opts {}}
                 {1 :hrsh7th/nvim-cmp
                  :dependencies [[:PaterJason/cmp-conjure]
                                 [:hrsh7th/cmp-buffer]
                                 [:hrsh7th/cmp-cmdline]
                                 [:hrsh7th/cmp-nvim-lsp]
                                 [:hrsh7th/cmp-path]
                                 [:hrsh7th/cmp-omni]
                                 [:hrsh7th/cmp-nvim-lua]
                                 [:L3MON4D3/LuaSnip]
                                 [:saadparwaiz1/cmp_luasnip]]
                  :config (mod :config.plugin.cmp)
                  :event :InsertEnter}
                 {1 :stevearc/conform.nvim
                  :config (mod :config.plugin.conform)
                  :lazy false}
                 {1 :folke/which-key.nvim :lazy false :opts {}}
                 {1 :nvim-telescope/telescope.nvim
                  :cmd :Telescope
                  :config (mod :config.plugin.telescope)
                  :dependencies [[:nvim-lua/popup.nvim]
                                 [:nvim-lua/plenary.nvim]
                                 [:nvim-telescope/telescope-ui-select.nvim]
                                 [:barrett-ruth/telescope-http.nvim]
                                 [:nvim-telescope/telescope-dap.nvim]
                                 [:nvim-treesitter/nvim-treesitter]
                                 [:natecraddock/telescope-zf-native.nvim]
                                 [:debugloop/telescope-undo.nvim]
                                 [:nvim-telescope/telescope-file-browser.nvim]
                                 [:danielvolchek/tailiscope.nvim]
                                 [:benfowler/telescope-luasnip.nvim]
                                 [:debugloop/telescope-undo.nvim]]}
                 {1 :pwntester/octo.nvim
                  :config (mod :config.plugin.octo)
                  :dependencies [[:nvim-tree/nvim-web-devicons]
                                 [:nvim-lua/plenary.nvim]
                                 [:nvim-telescope/telescope.nvim]]}
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
                 {1 :akinsho/toggleterm.nvim
                  :cmd [:ToggleTerm]
                  :config (mod :config.plugin.toggleterm)}
                 {1 :rose-pine/neovim :lazy false}
                 {1 :terryma/vim-expand-region :lazy false}
                 {1 :MunifTanjim/nui.nvim :lazy false}
                 {1 :ShinKage/idris2-nvim
                  :requires [:neovim/nvim-lspconfig :MunifTanjim/nui.nvim]
                  :ft [:idris2]
                  :config (mod :config.plugin.idris2)}
                 {1 :tpope/vim-characterize :lazy false}
                 {1 :airblade/vim-rooter :lazy false}
                 {1 :nvim-lua/plenary.nvim :lazy false}
                 {1 :folke/todo-comments.nvim
                  :lazy false
                  :dependencies [[:nvim-lua/plenary.nvim]
                                 [:folke/trouble.nvim]]
                  :opts {}}
                 {1 :folke/trouble.nvim
                  :lazy false
                  :dependencies [[:nvim-tree/nvim-web-devicons]]
                  :opts {}}
                 {1 :doctorfree/cheatsheet.nvim :lazy false :opts {}}
                 {1 :savq/melange-nvim
                  :lazy false
                  :config (mod :config.plugin.colorscheme)}
                 {1 :PaterJason/nvim-treesitter-sexp
                  :ft [:fennel :clojure :lisp]
                  :opts {}}
                 {1 :monkoose/nvlime
                  :ft [:lisp]
                  :dependencies [[:monkoose/parsley]]}])))

{}

