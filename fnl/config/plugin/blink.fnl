{1 :saghen/blink.cmp
 :build "cargo build --release"
 :dependencies [[:rafamadriz/friendly-snippets]
                [:mikavilpas/blink-ripgrep.nvim]]
 :lazy false
 :opts {:enabled (fn []
                   (and (not= _G.vim.bo.buftype :prompt)
                        (not= _G.vim.bo.buftype :TelescopePrompt)))
        :keymap {:preset :super-tab}
        :appearance {:use_nvim_cmp_as_default true :nerd_font_variant :mono}
        :sources {:default [:lsp :dadbod :ripgrep]
                  :cmdline {}
                  :providers {:ripgrep {:module :blink-ripgrep
                                        :name :Ripgrep
                                        :opts {:prefix_min_len 3
                                               :score_offset -3}}
                              :dadbod {:module :vim_dadbod_completion.blink
                                       :name :Dadbod}}}
        :completion {:keyword {:range :full}
                     :trigger {:show_on_trigger_character true
                               :show_on_insert_on_trigger_character true}
                     :menu {:border :single
                            :draw {:components {:kind_icon {:ellipsis false
                                                            :text (fn [ctx]
                                                                    (local (kind-icon _
                                                                                      _)
                                                                           ((. (require :mini.icons)
                                                                               :get) :lsp
                                                                                     ctx.kind))
                                                                    kind-icon)}}}}
                     :documentation {:auto_show true :window {:border :single}}}
        :signature {:enabled true :window {:border :single}}}
 :opts_extend [:default]}
