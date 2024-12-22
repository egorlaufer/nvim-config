(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (let [(ok? toggleterm) (pcall #(require :toggleterm))]
    (when ok?
      (toggleterm.setup {})
      (_G.vim.api.nvim_create_autocmd [:TermOpen]
                                      {:pattern "term://*"
                                       :callback (fn []
                                                   (let [group (_G.vim.api.nvim_create_augroup :TermAU
                                                                                               {})]
                                                     (_G.vim.api.nvim_create_autocmd [:FileType]
                                                                                     {: group
                                                                                      :pattern [:toggleterm]
                                                                                      :command "setlocal nospell"})
                                                     (_G.vim.api.nvim_create_autocmd [:TermOpen]
                                                                                     {: group
                                                                                      :command "setlocal nospell"})
                                                     (_G.vim.keymap.set :t
                                                                        :<esc>
                                                                        "<C-\\><C-n>"
                                                                        {:noremap true
                                                                         :silent true
                                                                         :nowait true
                                                                         :buffer 0})
                                                     (_G.vim.keymap.set :t
                                                                        :<C-h>
                                                                        "<Cmd>wincmd h<CR>"
                                                                        {:noremap true
                                                                         :silent true
                                                                         :nowait true
                                                                         :buffer 0})
                                                     (_G.vim.keymap.set :t
                                                                        :<C-j>
                                                                        "<Cmd>wincmd j<CR>"
                                                                        {:noremap true
                                                                         :silent true
                                                                         :nowait true
                                                                         :buffer 0})
                                                     (_G.vim.keymap.set :t
                                                                        :<C-k>
                                                                        "<Cmd>wincmd k<CR>"
                                                                        {:noremap true
                                                                         :silent true
                                                                         :nowait true
                                                                         :buffer 0})
                                                     (_G.vim.keymap.set :t
                                                                        :<C-l>
                                                                        "<Cmd>wincmd l<CR>"
                                                                        {:noremap true
                                                                         :silent true
                                                                         :nowait true
                                                                         :buffer 0})
                                                     (_G.vim.keymap.set :t
                                                                        :<C-w>
                                                                        "<C-\\><C-n><C-w>"
                                                                        {:noremap true
                                                                         :silent true
                                                                         :nowait true
                                                                         :buffer 0})))}))))

{1 :akinsho/toggleterm.nvim
 :cmd [:ToggleTerm]
 :keys [{1 :<leader><space>
         2 ":ToggleTerm<cr>"
         :mode :n
         :silent true
         :nowait true
         :desc :toggleterm}]
 :config (lazy-config-fn mod config)}
