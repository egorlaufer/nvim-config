(let [group (vim.api.nvim_create_augroup :YankAU {})]
  (vim.api.nvim_create_autocmd [:TextYankPost]
                               {: group
                                :callback (fn [] (vim.highlight.on_yank))}))

{}
