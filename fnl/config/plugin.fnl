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
                 (require :config.plugin.toggleterm)
                 (require :config.plugin.rose-pine)
                 (require :config.plugin.vim-expand-region)
                 (require :config.plugin.nui)
                 (require :config.plugin.idris2)
                 (require :config.plugin.vim-characterize)
                 (require :config.plugin.vim-rooter)
                 (require :config.plugin.plenary)
                 (require :config.plugin.todo-comments)
                 (require :config.plugin.trouble)
                 (require :config.plugin.cheatsheet)
                 (require :config.plugin.melange)
                 {1 :PaterJason/nvim-treesitter-sexp
                  :ft [:fennel :clojure :lisp]
                  :opts {}}
                 {1 :monkoose/nvlime
                  :ft [:lisp]
                  :dependencies [[:monkoose/parsley]]}])))

{}

