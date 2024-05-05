(import-macros {: lazy-config-fn} :config.init-macros)

(local mod ...)

(local ros-impl
       (.. "" """
        let g:nvlime_cl_impl = \"ros\"
        function! NvlimeBuildServerCommandFor_ros(nvlime_loader, nvlime_eval)
        return [\"ros\", \"run\",
               \\ \"--eval\", \"(ql:quickload :cl-who)\",
               \\ \"--eval\", \"(ql:quickload :cl-fad)\",
               \\ \"--eval\", \"(ql:quickload :parenscript)\",
               \\ \"--load\", a:nvlime_loader,
               \\ \"--eval\", a:nvlime_eval]
        endfunction
       """))

(fn config [plugin opts]
  (vim.api.nvim_exec ros-impl true)
  (set vim.g.nvlime_config {:implementation :ros}))


{1 :monkoose/nvlime :ft [:lisp] :dependencies [[:monkoose/parsley]]
:config (lazy-config-fn config mod)}
