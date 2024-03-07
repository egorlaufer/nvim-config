-- [nfnl] Compiled from fnl/lualine/themes/melange.fnl by https://github.com/Olical/nfnl, do not edit.
local bg = (vim.opt.background):get()
local palette = require(("melange/palettes/" .. bg))
local a = palette.a
local b = palette.b
local c = palette.c
local d = palette.d
local melange = {}
local insert_blue = "#9999BB"
melange.normal = {a = {bg = a.com, fg = a.bg}, b = {bg = a.bg, fg = a.com}, c = {bg = a.float, fg = a.com}}
melange.insert = {a = {bg = insert_blue, fg = a.bg}, b = {bg = a.bg, fg = insert_blue}, c = {bg = a.float, fg = insert_blue}}
melange.command = {a = {bg = c.yellow, fg = a.bg}, b = {bg = a.bg, fg = c.yellow}, c = {bg = a.float, fg = c.yellow}}
melange.visual = {a = {bg = c.magenta, fg = a.bg}, b = {bg = a.bg, fg = c.magenta}, c = {bg = a.float, fg = c.magenta}}
melange.replace = {a = {bg = c.green, fg = a.bg}, b = {bg = a.bg, fg = c.green}, c = {bg = a.float, fg = c.green}}
melange.terminal = {a = {bg = c.yellow, fg = a.bg}, b = {bg = a.bg, fg = c.yellow}, c = {bg = a.float, fg = c.yellow}}
melange.inactive = {a = {bg = a.com, fg = a.bg}, b = {bg = a.bg, fg = a.com, gui = "bold"}, c = {bg = a.float, fg = a.com}}
return melange
