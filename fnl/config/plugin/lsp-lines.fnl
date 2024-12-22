(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

{1 "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
 :dependencies [(require :config.plugin.nvim-lspconfig)]
 :opts {}
 :config (lazy-config-fn mod
                         (fn [_plugin opts]
                           (_G.vim.diagnostic.config {:virtual_text false})
                           (-?> (require :lsp_lines)
                                (: :setup opts))))}
