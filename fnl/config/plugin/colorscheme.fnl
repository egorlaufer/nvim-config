(fn config [plugin opts]
  (if (not= 0 (vim.fn.exists "g:neovide"))
      (do
        (print :LIGHT)
        (vim.cmd "set background=light")
        (vim.cmd "colorscheme paper"))
      (do
        (print :LIGHT)
        (vim.cmd "set background=dark")
        (vim.cmd "colorscheme rose-pine"))))

{: config}

