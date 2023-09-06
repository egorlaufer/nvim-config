(vim.api.nvim_create_autocmd [:FileType]
                             {:group (vim.api.nvim_create_augroup :NvimTreeAU
                                                                  {})
                              :pattern [:NvimTree]
                              :callback (fn [ev]
                                          (print :au)
                                          (vim.schedule (fn []
                                                          (let [buf (vim.fn.expand :<abuf>)]
                                                            (vim.api.nvim_win_set_option (vim.fn.bufwinid buf)
                                                                                         :signcolumn
                                                                                         :no)))))})
