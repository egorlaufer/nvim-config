(fn no-sign-column []
  (let [buf (vim.fn.expand :<abuf>)]
    (vim.api.nvim_win_set_option (vim.fn.bufwinid buf) :signcolumn :no)))

(let [group (vim.api.nvim_create_augroup :NvimTreeAU {})]
  (vim.api.nvim_create_autocmd [:FileType]
                               {: group
                                :pattern [:NvimTree]
                                :callback (fn [_ev]
                                            (vim.schedule no-sign-column))}))
