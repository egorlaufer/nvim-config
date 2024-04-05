;; [nfnl-macro]

(fn mod [f]
  (let [s (tostring f)]
    `(fn [plugin# opts#]
       (let [start# (vim.loop.hrtime)
             load-and-configure# (fn [f# plugin# opts#]
                                   (let [m# (require f#)]
                                     (m#.config plugin# opts#)))
             (fidget?# fidget#) (pcall #(require :fidget))
             (ok?# res#) (pcall load-and-configure# ,f plugin# opts#)]
         (if ok?#
             (do
               (when fidget?#
                 (let [ms# (/ (- (vim.loop.hrtime) start#) 1000000)]
                   (fidget#.notify (.. "Loaded: " ,s " in " ms# :ms))))
               true)
             (do
               (if fidget?#
                   (fidget#.notify (.. "Failed configuring: " ,s res#))
                   (print (.. "Failed configuring: " ,s res#)))
               false))))))

{: mod}

