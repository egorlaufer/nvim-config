(let [group (vim.api.nvim_create_augroup :TermAU {})]
  (vim.api.nvim_create_autocmd [:FileType]
                               {: group
                                :pattern [:toggleterm]
                                :command "setlocal nospell"})
  (vim.api.nvim_create_autocmd [:TermOpen]
                               {: group :command "setlocal nospell"}))

(let [group (vim.api.nvim_create_augroup :YankAU {})]
  (vim.api.nvim_create_autocmd [:TextYankPost]
                               {: group
                                :callback (fn [] (vim.highlight.on_yank))}))

{}

