(fn custom-attach [client bufnr]
  (fn map [from to]
    (let [to (.. ":" to :<cr>)]
      (vim.api.nvim_buf_set_keymap bufnr :n from to {:noremap true})))

  ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
  (map :gd "lua vim.lsp.buf.definition()")
  (map :gD "lua vim.lsp.buf.declaration()")
  (map :gr "lua vim.lsp.buf.references()")
  (map :gi "lua vim.lsp.buf.implementation()")
  (map :K "lua vim.lsp.buf.hover()")
  (map :<c-k> "lua vim.lsp.buf.signature_help()")
  (map :<c-p> "lua vim.diagnostic.goto_prev()")
  (map :<c-n> "lua vim.diagnostic.goto_next()")
  (map :<leader>lr "lua vim.lsp.buf.rename()")
  (map :<leader>lf "lua vim.lsp.buf.format()")
  (vim.api.nvim_buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifuc")
  (when client.server_capabilities.document_formatting
    (vim.api.nvim_buf_set_keymap bufnr :n :<leader>F
                                 ":lua vim.lsp.buf.formatting_sync()<cr>"
                                 {:noremap true}))
  (when client.server_capabilities.document_range_formatting
    (vim.api.nvim_buf_set_keymap bufnr :x :<leader>F
                                 ":lua vim.lsp.buf.range_formatting()<cr>"
                                 {:noremap true}))
  (when (= client.name :omnisharp)
    (tset client.server_capabilities :semanticTokensProvider nil)))

(fn config [plugin opts]
  (let [(ok? lspconfig) (pcall #(require :lspconfig))]
    (when ok?
      (let [(ok? lspconfig-configs) (pcall #(require :lspconfig.configs))
            (ok? cmp) (pcall #(require :cmp_nvim_lsp))
            capabilities (vim.tbl_deep_extend :force
                                              (vim.lsp.protocol.make_client_capabilities)
                                              (cmp.default_capabilities))]
        (when ok?
          (set lspconfig-configs.fennel_language_server
               {:default_config {:cmd [:fennel-language-server]
                                 :filetypes [:fennel]
                                 :single_file_support true
                                 :root_dir (lspconfig.util.root_pattern :fnl)
                                 :settings {:fennel {:workspace {:library (vim.api.nvim_list_runtime_paths)}
                                                     :diagnostics {:globals [:vim]}}}}}))
        (lspconfig.fennel_language_server.setup {:on_attach custom-attach
                                                 : capabilities})
        (lspconfig.lua_ls.setup {:on_attach custom-attach : capabilities})
        (lspconfig.elixirls.setup {:cmd [:elixir-ls]
                                   :on_attach custom-attach
                                   : capabilities})
        (lspconfig.erlangls.setup {:on_attach custom-attach : capabilities})
        (lspconfig.rust_analyzer.setup {:on_attach custom-attach
                                        : capabilities})
        (lspconfig.tailwindcss.setup {:on_attach custom-attach
                                      : capabilities
                                      :filetypes [:html :elixir :eelixir :heex]
                                      :init_options {:userLanguages {:elixir :html-eex
                                                                     :eelixir :html-eex
                                                                     :heex :html-eex}}
                                      :settings {:tailwindCSS {:experimental {:classRegex ["class[:]\\s*\"([^\"]*)\""]}}}})))))

{: config}

