(let [group (_G.vim.api.nvim_create_augroup :YankAU {})]
  (_G.vim.api.nvim_create_autocmd [:TextYankPost]
                                  {: group
                                   :callback (fn [] (_G.vim.highlight.on_yank))}))

{}
