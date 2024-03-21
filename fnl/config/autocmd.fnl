(let [group (vim.api.nvim_create_augroup :TermAU {})]
  (vim.api.nvim_create_autocmd [:FileType]
                               {: group
                                :pattern [:toggleterm]
                                :command "setlocal nospell"})
  (vim.api.nvim_create_autocmd [:TermOpen]
                               {: group :command "setlocal nospell"}))

{}

