-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local g = require((... .. ".global"))
local p = require((... .. ".plugin"))
local k = require((... .. ".keybind"))
local a = require((... .. ".autocmd"))
return {global = g, plugin = p, keybind = k, autocmd = a}
