(local util (require :config.util))

(util.set-normal-telescope :<leader>f* :grep_string)
(util.set-normal-telescope :<leader>f/ :current_buffer_fuzzy_find)
(util.set-normal-telescope :<leader>fa :autocommands)
(util.set-normal-telescope :<leader>fb :buffers)
(util.set-normal-telescope :<leader>fc :commands)
(util.set-normal-telescope :<leader>fch :command_history)
(util.set-normal-telescope :<leader>fd :diagnostics)
(util.set-normal-telescope :<leader>ff :file_browser)
(util.set-normal-telescope :<leader>fg :git_files)
(util.set-normal-telescope :<leader>fh :help_tags)
(util.set-normal-telescope :<leader>fj :jumplist)
(util.set-normal-telescope :<leader>fk :keymaps)
(util.set-normal-telescope :<leader>fl :live_grep)
(util.set-normal-telescope :<leader>fm :marks)
(util.set-normal-telescope :<leader>fn :resume)
(util.set-normal-telescope :<leader>fo :oldfiles)
(util.set-normal-telescope :<leader>fp :builtin)
(util.set-normal-telescope :<leader>fr :registers)
(util.set-normal-telescope :<leader>fs :search_history)
(util.set-normal-telescope :<leader>ft :filetypes)
(util.set-normal-telescope :<leader>fv :vim_options)

(util.set-normal-telescope :<leader>lb :lsp_document_symbols)
(util.set-normal-telescope :<leader>lci :lsp_incoming_calls)
(util.set-normal-telescope :<leader>lco :lsp_outgoing_calls)
(util.set-normal-telescope :<leader>ld :lsp_definitions)
(util.set-normal-telescope :<leader>li :lsp_implementations)
(util.set-normal-telescope :<leader>lr :lsp_references)
(util.set-normal-telescope :<leader>ls :lsp_dynamic_workspace_symbols)
(util.set-normal-telescope :<leader>lt :lsp_type_definitions)
(util.set-normal-telescope :<leader>lw :lsp_workspace_symbols)

(util.set-normal-telescope :<leader>gc :git_commits)
(util.set-normal-telescope :<leader>gb :git_bcommits)
(util.set-normal-telescope :<leader>gh :git_branches :ivy)
(util.set-normal-telescope :<leader>gs :git_status :ivy)
(util.set-normal :<leader>gn ":Git switch -c "
                 {:desc "new branch" :silent false})

(util.set-normal-telescope :<leader>xh "http list")
(util.set-normal-telescope :<leader>xu :undo)
(util.set-normal :<leader>lls ":lua vim.lsp.codelens.run()<CR>"
                 {:desc "codelens: run"})

(util.set-normal :<leader>llr ":lua vim.lsp.codelens.refresh()<CR>"
                 {:desc "codelens: refresh"})

(util.set-terminal :<Esc> "<C-\\><C-n>" {:desc "term escape"})

(util.set-normal :<leader><space> ":ToggleTerm<CR>" {:desc :toggleterm})

{}

