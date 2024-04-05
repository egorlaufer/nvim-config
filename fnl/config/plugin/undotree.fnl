(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(fn config [plugin opts]
  (tset vim.g :undotree_SplitWidth 40))

{1 :mbbill/undotree
 :cmd [:UndotreeToggle :UndotreeHide :UndotreeShow :UndotreeFocus]
 :lazy true
 :config (lazy-config-fn config mod)
 :opts {}}

