(fn config [plugin opts]
  (set vim.o.completeopt "menuone,noselect")
  (let [(ok? cmp) (pcall #(require :cmp))]
    (when ok?
      (let [(ok? luasnip) (pcall #(require :luasnip))]
        (when ok?
          (set vim.g.nvlime_config {:cmp {:enabled true}})
          (cmp.setup {:sources [{:name :conjure}
                                {:name :nvim_lsp}
                                {:name :buffer}
                                {:name :path}
                                {:name :rg
                                 :keyword_length 5
                                 :option {:debounce 1000}}
                                {:name :nvim_lua}]
                      :view {:entries :native}
                      :snippet {:expand (fn [args]
                                          (luasnip.lsp_expand args.body))}
                      :completion {:completeopt "menu,menuone,noinsert"}
                      :mapping (cmp.mapping.preset.insert {:<C-b> (cmp.mapping.scroll_docs -4)
                                                           :<C-f> (cmp.mapping.scroll_docs 4)
                                                           :<C-Space> (cmp.mapping.complete)
                                                           :<C-e> (cmp.mapping.abort)
                                                           :<C-y> (cmp.mapping.confirm {:select true})
                                                           :<C-n> (cmp.mapping.select_next_item)
                                                           :<C-p> (cmp.mapping.select_prev_item)
                                                           :<C-l> (cmp.mapping (fn []
                                                                                 (when (luasnip.expand_or_locally_jumpable)
                                                                                   (luasnip.expand_or_jump)))
                                                                               [:i
                                                                                :s])
                                                           :<C-h> (cmp.mapping (fn []
                                                                                 (when (luasnip.expand_or_locally_jumpable)
                                                                                   (luasnip.expand_or_jump -1)))
                                                                               [:i
                                                                                :s])})})
          (cmp.setup.filetype :gitcommit
                              {:sources [{:name :cmp_git}
                                         {:name :path}
                                         {:name :buffer}
                                         {:name :rg
                                          :keyword_length 5
                                          :option {:debounce 1000}}]})
          (cmp.setup.filetype :lisp
                              {:sources [{:name :nvlime}
                                         {:name :conjure}
                                         {:name :nvim_lsp}
                                         {:name :buffer}
                                         {:name :path}
                                         {:name :rg
                                          :keyword_length 5
                                          :option {:debounce 1000}}
                                         {:name :nvim_lua}]}))))))

{: config}

