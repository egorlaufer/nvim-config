(fn config [plugin opts]
  (let [(ok? lspconfig) (pcall #(require :lspconfig))]
    (when ok?
      (let [(ok? lspconfig-configs) (pcall #(require :lspconfig.configs))]
        (when ok?
          (set lspconfig-configs.fennel_language_server
               {:default_config {:cmd [:fennel-language-server]
                                 :filetypes [:fennel]
                                 :single_file_support true
                                 :root_dir (lspconfig.util.root_pattern :fnl)
                                 :settings {:fennel {:workspace {:library (vim.api.nvim_list_runtime_paths)}
                                                     :diagnostics {:globals [:vim]}}}}})))
      (lspconfig.fennel_language_server.setup {})
      (lspconfig.lua_ls.setup {})
      (lspconfig.elixirls.setup {:cmd [:elixir-ls]})
      (lspconfig.erlangls.setup {})
      (lspconfig.rust_analyzer.setup {}))))

{: config}
