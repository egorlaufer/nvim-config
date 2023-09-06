(fn config [plugin opts]
  (set vim.o.completeopt "menuone,noselect")
  (let [(ok? cmp) (pcall #(require :cmp))]
    (when ok?
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
                                      (let [(ok? luasnip) (pcall #(require :luasnip))]
                                        (when ok?
                                          (luasnip.lsp_expand args.body))))}
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

{: config}

