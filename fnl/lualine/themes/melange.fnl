;; adaptation of https://github.com/Martin1887/melangeDarkerWarm-nvim

(local bg (vim.opt.background:get))
(local palette (require (.. :melange/palettes/ bg)))
(local a palette.a)
(local b palette.b)
(local c palette.c)
(local d palette.d)
(local melange {})
(local insert-blue "#9999BB")
(set melange.normal {:a {:bg a.com :fg a.bg}
                     :b {:bg a.bg :fg a.com}
                     :c {:bg a.float :fg a.com}})

(set melange.insert {:a {:bg insert-blue :fg a.bg}
                     :b {:bg a.bg :fg insert-blue}
                     :c {:bg a.float :fg insert-blue}})

(set melange.command {:a {:bg c.yellow :fg a.bg}
                      :b {:bg a.bg :fg c.yellow}
                      :c {:bg a.float :fg c.yellow}})

(set melange.visual {:a {:bg c.magenta :fg a.bg}
                     :b {:bg a.bg :fg c.magenta}
                     :c {:bg a.float :fg c.magenta}})

(set melange.replace {:a {:bg c.green :fg a.bg}
                      :b {:bg a.bg :fg c.green}
                      :c {:bg a.float :fg c.green}})

(set melange.terminal {:a {:bg c.yellow :fg a.bg}
                       :b {:bg a.bg :fg c.yellow}
                       :c {:bg a.float :fg c.yellow}})

(set melange.inactive {:a {:bg a.com :fg a.bg}
                       :b {:bg a.bg :fg a.com :gui :bold}
                       :c {:bg a.float :fg a.com}})

melange

