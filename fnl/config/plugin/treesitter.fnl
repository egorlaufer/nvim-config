(fn config [plugin opts]
  (let [(ok? treesitter) (pcall #(require :nvim-treesitter.configs))]
    (when ok?
      (treesitter.setup {:highlight {:enabled true
                                     :additional_vim_regex_highlighting false}})
      (vim.cmd "TSEnable highlight"))))

{: config}
