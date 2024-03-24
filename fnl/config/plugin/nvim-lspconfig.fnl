(fn custom-attach [client bufnr]
  (fn map [mode from to]
    (let [to (.. ":" to :<cr>)]
      (vim.keymap.set mode from to {:buffer bufnr :noremap true})))

  (fn x-map [from to] (map :x from to))

  (fn n-map [from to] (map :n from to))

  (fn map-fn [from to-fn]
    (vim.keymap.set :n from to-fn {:buffer bufnr :noremap true}))

  ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
  (map-fn :gd (. (require :telescope.builtin) :lsp_definitions))
  (map-fn :gD vim.lsp.buf.declaration)
  (map-fn :gr (. (require :telescope.builtin) :lsp_references))
  (map-fn :gI (. (require :telescope.builtin) :lsp_implementations))
  (map-fn :K vim.lsp.buf.hover)
  (map-fn :<c-k> vim.lsp.buf.signature_help)
  (map-fn :<c-p> vim.diagnostic.goto_prev)
  (map-fn :<c-n> vim.diagnostic.goto_next)
  (map-fn :<leader>rn vim.lsp.buf.rename)
  (map-fn :<leader>cf vim.lsp.buf.format)
  (map-fn :<leader>ca vim.lsp.buf.code_action)
  (map-fn :<leader>ds (. (require :telescope.builtin) :lsp_document_symbols))
  (map-fn :<leader>ws (. (require :telescope.builtin)
                         :lsp_dynamic_workspace_symbols))
  (vim.api.nvim_buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifuc")
  (when client.server_capabilities.document_formatting
    (n-map :<leader>F "lua vim.lsp.buf.formatting_sync()"))
  (when client.server_capabilities.document_range_formatting
    (x-map :<leader>F "lua vim.lsp.buf.range_formatting()"))
  (when (= client.name :omnisharp)
    (tset client.server_capabilities :semanticTokensProvider nil))
  (when client.server_capabilities.documentHighlightProvider
    (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                                 {:buffer bufnr
                                  :callback vim.lsp.buf.document_highlight})
    (vim.api.nvim_create_autocmd [:CursorMoved :CursorMovedI]
                                 {:buffer bufnr
                                  :callback vim.lsp.buf.clear_references})))

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
                                      :settings {:tailwindCSS {:experimental {:classRegex ["class[:]\\s*\"([^\"]*)\""]}}}})
        (lspconfig.ansiblels.setup {})))))

{: config}

