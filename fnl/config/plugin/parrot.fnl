(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

{1 :frankroeder/parrot.nvim
 :dependencies [[:ibhagwan/fzf-lua :nvim-lua/plenary.nvim]]
 :opts {}
 :lazy false
 :config (lazy-config-fn mod
                         (fn [_plugin _opts]
                           ((. (require :parrot) :setup) {:providers {:gemini {:api_key (_G.os.getenv :GEMINI_API_KEY)}}})))}
