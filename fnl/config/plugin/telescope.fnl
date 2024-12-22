(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? telescope) (pcall #(require :telescope))
        (_ok themes) (pcall #(require :telescope.themes))]
    (when ok?
      (telescope.setup {:defaults (vim.tbl_extend :force (themes.get_ivy)
                                                  {:path_display {:truncate 2}
                                                   :extensions {:file_browser {:hijack_netrw true}}})})
      (telescope.load_extension :zf-native)
      (telescope.load_extension :undo)
      (telescope.load_extension :file_browser)
      (telescope.load_extension :tailiscope)
      (telescope.load_extension :luasnip)
      (telescope.load_extension :undo))))

(fn tele-key [keys command]
  {1 keys
   2 (.. ":Telescope " command :<cr>)
   :mode :n
   :silent true
   :nowait true
   :desc (.. "tele " command)})

{1 :nvim-telescope/telescope.nvim
 :cmd :Telescope
 :config (lazy-config-fn mod config)
 :dependencies [[:nvim-lua/popup.nvim]
                [:nvim-lua/plenary.nvim]
                [:nvim-telescope/telescope-ui-select.nvim]
                [:nvim-telescope/telescope-dap.nvim]
                [:nvim-treesitter/nvim-treesitter]
                [:natecraddock/telescope-zf-native.nvim]
                [:debugloop/telescope-undo.nvim]
                [:nvim-telescope/telescope-file-browser.nvim]
                [:danielvolchek/tailiscope.nvim]
                [:benfowler/telescope-luasnip.nvim]
                [:debugloop/telescope-undo.nvim]
                [{1 :rachartier/tiny-code-action.nvim :opts {}}]]
 :keys [(tele-key :<leader>f* :grep_string)
        (tele-key :<leader>f/ :current_buffer_fuzzy_find)
        (tele-key :<leader>fa :autocommands)
        (tele-key :<leader>fb :buffers)
        (tele-key :<leader>fc :commands)
        (tele-key :<leader>fch :command_history)
        (tele-key :<leader>fd :diagnostics)
        (tele-key :<leader>ff :file_browser)
        (tele-key :<leader>fg :git_files)
        (tele-key :<leader>fh :help_tags)
        (tele-key :<leader>fj :jumplist)
        (tele-key :<leader>fk :keymaps)
        (tele-key :<leader>fl :live_grep)
        (tele-key :<leader>fm :marks)
        (tele-key :<leader>fn :resume)
        (tele-key :<leader>fo :oldfiles)
        (tele-key :<leader>fp :builtin)
        (tele-key :<leader>fr :registers)
        (tele-key :<leader>fs :search_history)
        (tele-key :<leader>ft :filetypes)
        (tele-key :<leader>fv :vim_options)
        (tele-key :<leader>lb :lsp_document_symbols)
        (tele-key :<leader>lci :lsp_incoming_calls)
        (tele-key :<leader>lco :lsp_outgoing_calls)
        (tele-key :<leader>ld :lsp_definitions)
        (tele-key :<leader>li :lsp_implementations)
        (tele-key :<leader>lr :lsp_references)
        (tele-key :<leader>ls :lsp_dynamic_workspace_symbols)
        (tele-key :<leader>lt :lsp_type_definitions)
        (tele-key :<leader>lw :lsp_workspace_symbols)
        (tele-key :<leader>gc :git_commits)
        (tele-key :<leader>gb :git_bcommits)
        (tele-key :<leader>gh :git_branches)
        (tele-key :<leader>gs :git_status)
        (tele-key :<leader>xu :undo)]}
