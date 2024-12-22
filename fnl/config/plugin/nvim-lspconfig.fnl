(import-macros {: lazy-config-fn} :config.init-macros)

(local util (require :config.util))
(local mod ...)
(local lexical-bin :start_lexical.sh)

(local omnisharp-token-types [:comment
                              :excluded_code
                              :identifier
                              :keyword
                              :keyword_control
                              :number
                              :operator
                              :operator_overloaded
                              :preprocessor_keyword
                              :string
                              :whitespace
                              :text
                              :static_symbol
                              :preprocessor_text
                              :punctuation
                              :string_verbatim
                              :string_escape_character
                              :class_name
                              :delegate_name
                              :enum_name
                              :interface_name
                              :module_name
                              :struct_name
                              :type_parameter_name
                              :field_name
                              :enum_member_name
                              :constant_name
                              :local_name
                              :parameter_name
                              :method_name
                              :extension_method_name
                              :property_name
                              :event_name
                              :namespace_name
                              :label_name
                              :xml_doc_comment_attribute_name
                              :xml_doc_comment_attribute_quotes
                              :xml_doc_comment_attribute_value
                              :xml_doc_comment_cdata_section
                              :xml_doc_comment_comment
                              :xml_doc_comment_delimiter
                              :xml_doc_comment_entity_reference
                              :xml_doc_comment_name
                              :xml_doc_comment_processing_instruction
                              :xml_doc_comment_text
                              :xml_literal_attribute_name
                              :xml_literal_attribute_quotes
                              :xml_literal_attribute_value
                              :xml_literal_cdata_section
                              :xml_literal_comment
                              :xml_literal_delimiter
                              :xml_literal_embedded_expression
                              :xml_literal_entity_reference
                              :xml_literal_name
                              :xml_literal_processing_instruction
                              :xml_literal_text
                              :regex_comment
                              :regex_character_class
                              :regex_anchor
                              :regex_quantifier
                              :regex_grouping
                              :regex_alternation
                              :regex_text
                              :regex_self_escaped_character
                              :regex_other_escape])

(fn omnisharp-capabilities [capabilities]
  (_G.vim.tbl_deep_extend :force capabilities
                          {:semanticTokensProvider {:full (_G.vim.empty_dict)
                                                    :legend {:tokenModifiers [:static_symbol]
                                                             :tokenTypes omnisharp-token-types}
                                                    :range true}}))

(fn custom-attach [client bufnr]
  ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
  (util.set-normal-telescope :gd :lsp_definitions {:buffer bufnr})
  (util.set-normal-telescope :gD :lsp_type_definitions {:buffer bufnr})
  (util.set-normal-telescope :gr :lsp_references {:buffer bufnr})
  (util.set-normal-telescope :gI :lsp_implementations {:buffer bufnr})
  (util.set-normal-telescope :<leader>ws :lsp_dynamic_workspace_symbols
                             {:buffer bufnr})
  (util.set-normal :K _G.vim.lsp.buf.hover
                   {:desc :vim.lsp.buf.hover :buffer bufnr})
  (util.set-normal :<c-k> _G.vim.lsp.buf.signature_help
                   {:desc :vim.lsp.buf.signature_help :buffer bufnr})
  (util.set-normal :<c-p> _G.vim.diagnostic.goto_prev
                   {:desc :vim.diagnostic.goto_prev :buffer bufnr})
  (util.set-normal :<c-n> _G.vim.diagnostic.goto_next
                   {:desc :vim.diagnostic.goto_next :buffer bufnr})
  (util.set-normal :<leader>rn _G.vim.lsp.buf.rename
                   {:desc :vim.lsp.buf.rename :buffer bufnr})
  (util.set-normal :<leader>cf _G.vim.lsp.buf.format
                   {:desc :vim.lsp.buf.format :buffer bufnr})
  (util.set-normal :<leader>ca _G.vim.lsp.buf.code_action
                   {:desc :vim.lsp.buf.code_action :buffer bufnr})
  (let [(ok? tca) (pcall #(require :tiny-code-action))]
    (when ok?
      (util.set-normal :<leader>ca tca.code_action
                       {:desc :vim.lsp.buf.code_action :buffer bufnr})))
  (_G.vim.api.nvim_buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifuc")
  (when client.server_capabilities.document_formatting
    (util.set-normal :<leader>F _G.vim.lsp.buf.formatting_sync
                     {:desc :vim.lsp.buf.formatting_sync :buffer bufnr}))
  (when client.server_capabilities.document_range_formatting
    (util.set-visual :<leader>F _G.vim.lsp.buf.range_formatting
                     {:desc :vim.lsp.buf.range_formatting :buffer bufnr}))
  (when (= client.name :omnisharp)
    (tset client.server_capabilities :semanticTokensProvider nil))
  (when client.server_capabilities.documentHighlightProvider
    (_G.vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                                    {:buffer bufnr
                                     :callback _G.vim.lsp.buf.document_highlight})
    (_G.vim.api.nvim_create_autocmd [:CursorMoved :CursorMovedI]
                                    {:buffer bufnr
                                     :callback _G.vim.lsp.buf.clear_references})))

(fn config [_plugin _opts]
  (let [(ok? lspconfig) (pcall #(require :lspconfig))]
    (when ok?
      (let [(ok? lspconfig-configs) (pcall #(require :lspconfig.configs))
            (ok? cmp) (pcall #(require :cmp_nvim_lsp))
            capabilities (_G.vim.tbl_deep_extend :force
                                                 (_G.vim.lsp.protocol.make_client_capabilities)
                                                 (cmp.default_capabilities))]
        (when (not lspconfig-configs.lexical)
          (set lspconfig-configs.lexical
               {:default_config {:cmd [lexical-bin]
                                 :filetypes [:elixir :eelixr :heex]
                                 :root_dir (fn [fname]
                                             (or ((lspconfig.util.root_pattern :mix.exs
                                                                               :.git) fname)
                                                 (_G.vim.loop.os_homedir)))
                                 :settings {}}}))
        (lspconfig.fennel_ls.setup {:on_attach custom-attach
                                    : capabilities
                                    :settings {:fennel-ls {:extra-globals :vim}}})
        (lspconfig.lua_ls.setup {:on_attach custom-attach : capabilities})
        (lspconfig.lexical.setup {:on_attach custom-attach : capabilities})
        (lspconfig.erlangls.setup {:on_attach custom-attach : capabilities})
        (lspconfig.rust_analyzer.setup {:on_attach custom-attach
                                        : capabilities})
        (lspconfig.tailwindcss.setup {:on_attach custom-attach
                                      : capabilities
                                      :filetypes [:html :elixir :eelixir :heex]
                                      :init_options {:userLanguages {:elixir :html-eex
                                                                     :eelixir :html-eex
                                                                     :heex :html-eex}}
                                      :settings {:tailwindCSS {:experimental {:classRegex ["class[:]\\s*\"([^\"]*)\""]}}}})
        (lspconfig.ansiblels.setup {:on_attach custom-attach : capabilities})
        (lspconfig.zls.setup {:on_attach custom-attach : capabilities})
        (lspconfig.omnisharp.setup {:cmd [:omnisharp]
                                    :root_dir (lspconfig.util.root_pattern :*.sln
                                                                           :*.csproj)
                                    :on_attach custom-attach
                                    :capabilities (omnisharp-capabilities capabilities)})))))

{1 :neovim/nvim-lspconfig
 :ft [:fennel :lua :erlang :elixir :rust :idris2 :cs :zig]
 :config (lazy-config-fn mod config)
 :lazy true
 :dependencies [{1 :williamboman/mason-lspconfig.nvim
                 :opts {}
                 :dependencies [{1 :williamboman/mason.nvim
                                 :cmd [:Mason
                                       :MasonUpdate
                                       :MasonInstall
                                       :MasonUninstall
                                       :MasonUninstallAll
                                       :MasonLog]
                                 :opts {}}]}
                [:ray-x/lsp_signature.nvim]]}
