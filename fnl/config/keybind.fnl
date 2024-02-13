(fn set-normal [k command desc]
  (vim.keymap.set :n k command {: desc :noremap true :silent true :nowait true}))

(fn telescope [command theme]
  (.. ":Telescope " command " theme=" theme :<cr>))

(fn set-normal-telescope [k command theme]
  (set-normal k (telescope command theme) (.. "tele " command)))

(set-normal :<leader>t ":NvimTreeToggle<cr>" "nvim-tree: toggle")

(set-normal-telescope :<leader>f* :grep_string :ivy)
(set-normal-telescope :<leader>f/ :current_buffer_fuzzy_find :ivy)
(set-normal-telescope :<leader>fa :autocommands :ivy)
(set-normal-telescope :<leader>fb :buffers :ivy)
(set-normal-telescope :<leader>fc :commands :ivy)
(set-normal-telescope :<leader>fch :command_history :ivy)
(set-normal-telescope :<leader>fd :diagnostics :ivy)
(set-normal-telescope :<leader>ff :find_files :ivy)
(set-normal-telescope :<leader>fg :git_files :ivy)
(set-normal-telescope :<leader>fh :help_tags :ivy)
(set-normal-telescope :<leader>fj :jumplist :ivy)
(set-normal-telescope :<leader>fk :keymaps :ivy)
(set-normal-telescope :<leader>fl :live_grep :ivy)
(set-normal-telescope :<leader>fm :man_pages :ivy)
(set-normal-telescope :<leader>fn :resume :ivy)
(set-normal-telescope :<leader>fo :oldfiles :ivy)
(set-normal-telescope :<leader>fp :builtin :ivy)
(set-normal-telescope :<leader>fr :registers :ivy)
(set-normal-telescope :<leader>fs :search_history :ivy)
(set-normal-telescope :<leader>ft :filetypes :ivy)
(set-normal-telescope :<leader>fv :vim_options :ivy)

(set-normal-telescope :<leader>lb :lsp_document_symbols :ivy)
(set-normal-telescope :<leader>lci :lsp_incoming_calls :ivy)
(set-normal-telescope :<leader>lco :lsp_outgoing_calls :ivy)
(set-normal-telescope :<leader>ld :lsp_definitions :ivy)
(set-normal-telescope :<leader>li :lsp_implementations :ivy)
(set-normal-telescope :<leader>lr :lsp_references :ivy)
(set-normal-telescope :<leader>ls :lsp_dynamic_workspace_symbols :ivy)
(set-normal-telescope :<leader>lt :lsp_type_definitions :ivy)
(set-normal-telescope :<leader>lw :lsp_workspace_symbols :ivy)

(set-normal-telescope :<leader>gc :git_commits :ivy)
(set-normal-telescope :<leader>gb :git_bcommits :ivy)
(set-normal-telescope :<leader>gh :git_branches :ivy)
(set-normal-telescope :<leader>gs :git_status :ivy)

(set-normal-telescope :<leader>xh "http list" :ivy)
(set-normal-telescope :<leader>xu :undo :ivy)
