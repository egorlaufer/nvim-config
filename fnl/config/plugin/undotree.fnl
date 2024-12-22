(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (set _G.vim.g.undotree_SplitWidth 40))

{1 :mbbill/undotree
 :cmd [:UndotreeToggle :UndotreeHide :UndotreeShow :UndotreeFocus]
 :event :VeryLazy
 :config (lazy-config-fn mod config)
 :opts {}}
