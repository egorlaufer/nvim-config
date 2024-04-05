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
                 (require :config.plugin.undotree)
                 (require :config.plugin.cmp)
                 (require :config.plugin.conform)
                 (require :config.plugin.which-key)
                 (require :config.plugin.telescope)
                 (require :config.plugin.octo)
                 (require :config.plugin.vim-commentary)
                 (require :config.plugin.vim-fugitive)
                 (require :config.plugin.vim-surround)
                 (require :config.plugin.guess-indent)
                 (require :config.plugin.whitespace)
                 (require :config.plugin.nvim-tree)
                 (require :config.plugin.nvim-dap)
                 (require :config.plugin.nvim-dap-ui)
                 (require :config.plugin.rust-tools)
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

