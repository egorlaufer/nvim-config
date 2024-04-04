(fn set-key [m k command opts]
  (vim.keymap.set :n k command
                  (vim.tbl_extend :force
                                  {:noremap true :silent true :nowait true} opts)))

(fn set-normal [k command opts] (set-key :n k command opts))
(fn set-terminal [k command opts] (set-key :t k command opts))
(fn set-visual [k command opts] (set-key :x k command opts))

(fn telescope [command opts]
  (if (and (not= nil opts) (not= nil opts.theme))
      (.. ":Telescope " command " theme=" opts.theme :<cr>)
      (.. ":Telescope " command :<cr>)))

(fn set-normal-telescope [k command opts]
  (set-normal k (telescope command opts) {:desc (.. "tele " command)}))

{: set-normal : set-terminal : set-normal-telescope}

