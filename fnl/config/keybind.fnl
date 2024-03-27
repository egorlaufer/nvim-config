(fn set-normal [k command opts]
  (vim.keymap.set :n k command
                  (vim.tbl_extend :force
                                  {:noremap true :silent true :nowait true} opts)))

(fn set-terminal [k command opts]
  (vim.keymap.set :t k command
                  (vim.tbl_extend :force
                                  {:noremap true :silent true :nowait true} opts)))

(fn telescope [command theme]
  (if (not= nil theme)
      (.. ":Telescope " command " theme=" theme :<cr>)
      (.. ":Telescope " command :<cr>)))

(fn set-normal-telescope [k command theme]
  (set-normal k (telescope command theme) {:desc (.. "tele " command)}))

(set-normal-telescope :<leader>f* :grep_string)
(set-normal-telescope :<leader>f/ :current_buffer_fuzzy_find)
(set-normal-telescope :<leader>fa :autocommands)
(set-normal-telescope :<leader>fb :buffers)
(set-normal-telescope :<leader>fc :commands)
(set-normal-telescope :<leader>fch :command_history)
(set-normal-telescope :<leader>fd :diagnostics)
(set-normal-telescope :<leader>ff :file_browser)
(set-normal-telescope :<leader>fg :git_files)
(set-normal-telescope :<leader>fh :help_tags)
(set-normal-telescope :<leader>fj :jumplist)
(set-normal-telescope :<leader>fk :keymaps)
(set-normal-telescope :<leader>fl :live_grep)
(set-normal-telescope :<leader>fm :marks)
(set-normal-telescope :<leader>fn :resume)
(set-normal-telescope :<leader>fo :oldfiles)
(set-normal-telescope :<leader>fp :builtin)
(set-normal-telescope :<leader>fr :registers)
(set-normal-telescope :<leader>fs :search_history)
(set-normal-telescope :<leader>ft :filetypes)
(set-normal-telescope :<leader>fv :vim_options)

(set-normal-telescope :<leader>lb :lsp_document_symbols)
(set-normal-telescope :<leader>lci :lsp_incoming_calls)
(set-normal-telescope :<leader>lco :lsp_outgoing_calls)
(set-normal-telescope :<leader>ld :lsp_definitions)
(set-normal-telescope :<leader>li :lsp_implementations)
(set-normal-telescope :<leader>lr :lsp_references)
(set-normal-telescope :<leader>ls :lsp_dynamic_workspace_symbols)
(set-normal-telescope :<leader>lt :lsp_type_definitions)
(set-normal-telescope :<leader>lw :lsp_workspace_symbols)

(set-normal-telescope :<leader>gc :git_commits)
(set-normal-telescope :<leader>gb :git_bcommits)
(set-normal-telescope :<leader>gh :git_branches :ivy)
(set-normal-telescope :<leader>gs :git_status :ivy)
(set-normal :<leader>gn ":Git switch -c " {:desc "new branch" :silent false})

(set-normal-telescope :<leader>xh "http list")
(set-normal-telescope :<leader>xu :undo)
(set-normal :<leader>lls ":lua vim.lsp.codelens.run()<CR>"
            {:desc "codelens: run"})

(set-normal :<leader>llr ":lua vim.lsp.codelens.refresh()<CR>"
            {:desc "codelens: refresh"})

(set-terminal :<Esc> "<C-\\><C-n>" {:desc "term escape"})

(set-normal :<leader><space> ":ToggleTerm<CR>" {:desc :toggleterm})

{}

