(fn set-normal [k command opts]
  (vim.keymap.set :n k command
                  (vim.tbl_extend :force
                                  {:noremap true :silent true :nowait true} opts)))

(fn set-terminal [k command opts]
  (vim.keymap.set :t k command
                  (vim.tbl_extend :force
                                  {:noremap true :silent true :nowait true} opts)))

(fn telescope [command theme]
  (.. ":Telescope " command " theme=" theme :<cr>))

(fn set-normal-telescope [k command theme]
  (set-normal k (telescope command theme) {:desc (.. "tele " command)}))

(set-normal-telescope :<leader>f* :grep_string :dropdown)
(set-normal-telescope :<leader>f/ :current_buffer_fuzzy_find :dropdown)
(set-normal-telescope :<leader>fa :autocommands :dropdown)
(set-normal-telescope :<leader>fb :buffers :dropdown)
(set-normal-telescope :<leader>fc :commands :dropdown)
(set-normal-telescope :<leader>fch :command_history :dropdown)
(set-normal-telescope :<leader>fd :diagnostics :dropdown)
(set-normal-telescope :<leader>ff :file_browser :dropdown)
(set-normal-telescope :<leader>fg :git_files :dropdown)
(set-normal-telescope :<leader>fh :help_tags :dropdown)
(set-normal-telescope :<leader>fj :jumplist :dropdown)
(set-normal-telescope :<leader>fk :keymaps :dropdown)
(set-normal-telescope :<leader>fl :live_grep :dropdown)
(set-normal-telescope :<leader>fm :marks :dropdown)
(set-normal-telescope :<leader>fn :resume :dropdown)
(set-normal-telescope :<leader>fo :oldfiles :dropdown)
(set-normal-telescope :<leader>fp :builtin :dropdown)
(set-normal-telescope :<leader>fr :registers :dropdown)
(set-normal-telescope :<leader>fs :search_history :dropdown)
(set-normal-telescope :<leader>ft :filetypes :dropdown)
(set-normal-telescope :<leader>fv :vim_options :dropdown)

(set-normal-telescope :<leader>lb :lsp_document_symbols :dropdown)
(set-normal-telescope :<leader>lci :lsp_incoming_calls :dropdown)
(set-normal-telescope :<leader>lco :lsp_outgoing_calls :dropdown)
(set-normal-telescope :<leader>ld :lsp_definitions :dropdown)
(set-normal-telescope :<leader>li :lsp_implementations :dropdown)
(set-normal-telescope :<leader>lr :lsp_references :dropdown)
(set-normal-telescope :<leader>ls :lsp_dynamic_workspace_symbols :dropdown)
(set-normal-telescope :<leader>lt :lsp_type_definitions :dropdown)
(set-normal-telescope :<leader>lw :lsp_workspace_symbols :dropdown)

(set-normal-telescope :<leader>gc :git_commits :dropdown)
(set-normal-telescope :<leader>gb :git_bcommits :dropdown)
(set-normal-telescope :<leader>gh :git_branches :dropdown)
(set-normal-telescope :<leader>gs :git_status :dropdown)
(set-normal :<leader>gn ":Git switch -c " {:desc "new branch" :silent false})

(set-normal-telescope :<leader>xh "http list" :dropdown)
(set-normal-telescope :<leader>xu :undo :dropdown)
(set-normal :<leader>lls ":lua vim.lsp.codelens.run()<CR>"
            {:desc "codelens: run"})

(set-normal :<leader>llr ":lua vim.lsp.codelens.refresh()<CR>"
            {:desc "codelens: refresh"})

(set-terminal :<Esc> "<C-\\><C-n>" {:desc "nvim-tree: toggle"})

(set-normal :<leader><space> ":ToggleTerm<CR>" {:desc :toggleterm})

{}

