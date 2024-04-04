(local util (require :config.util))
(fn custom-attach [client bufnr]
  ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
  (util.set-normal-telescope :gd :lsp_definitions {:buffer bufnr})
  (util.set-normal-telescope :gD :lsp_type_definitions {:buffer bufnr})
  (util.set-normal-telescope :gr :lsp_references {:buffer bufnr})
  (util.set-normal-telescope :gI :lsp_implementations {:buffer bufnr})
  (util.set-normal-telescope :<leader>ds :lsp_document_symbols {:buffer bufnr})
  (util.set-normal-telescope :<leader>ws :lsp_dynamic_workspace_symbols
                             {:buffer bufnr})
  (util.set-normal :K vim.lsp.buf.hover
                   {:desc :vim.lsp.buf.hover :buffer bufnr})
  (util.set-normal :<c-k> vim.lsp.buf.signature_help
                   {:desc :vim.lsp.buf.signature_help :buffer bufnr})
  (util.set-normal :<c-p> vim.diagnostic.goto_prev
                   {:desc :vim.diagnostic.goto_prev :buffer bufnr})
  (util.set-normal :<c-n> vim.diagnostic.goto_next
                   {:desc :vim.diagnostic.goto_next :buffer bufnr})
  (util.set-normal :<leader>rn vim.lsp.buf.rename
                   {:desc :vim.lsp.buf.rename :buffer bufnr})
  (util.set-normal :<leader>cf vim.lsp.buf.format
                   {:desc :vim.lsp.buf.format :buffer bufnr})
  (util.set-normal :<leader>ca vim.lsp.buf.code_action
                   {:desc :vim.lsp.buf.code_action :buffer bufnr})
  (vim.api.nvim_buf_set_option bufnr :omnifunc "v:lua.vim.lsp.omnifuc")
  (when client.server_capabilities.document_formatting
    (util.set-normal :<leader>F vim.lsp.buf.formatting_sync
                     {:desc :vim.lsp.buf.formatting_sync :buffer bufnr}))
  (when client.server_capabilities.document_range_formatting
    (util.set-visual :<leader>F vim.lsp.buf.range_formatting
                     {:desc :vim.lsp.buf.range_formatting :buffer bufnr}))
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
        (lspconfig.fennel_ls.setup {:on_attach custom-attach
                                    : capabilities
                                    :settings {:fennel-ls {:extra-globals :vim}}})
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

