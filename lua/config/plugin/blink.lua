-- [nfnl] Compiled from fnl/config/plugin/blink.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return ((_G.vim.bo.buftype ~= "prompt") and (_G.vim.bo.buftype ~= "TelescopePrompt"))
end
local function _2_(ctx)
  local kind_icon, _, _0 = require("mini.icons").get("lsp", ctx.kind)
  return kind_icon
end
return {"saghen/blink.cmp", build = "cargo build --release", dependencies = {{"rafamadriz/friendly-snippets"}, {"mikavilpas/blink-ripgrep.nvim"}}, opts = {enabled = _1_, keymap = {preset = "super-tab"}, appearance = {use_nvim_cmp_as_default = true, nerd_font_variant = "mono"}, sources = {default = {"lsp", "dadbod", "ripgrep"}, cmdline = {}, providers = {ripgrep = {module = "blink-ripgrep", name = "Ripgrep", opts = {prefix_min_len = 3, score_offset = -3}}, dadbod = {module = "vim_dadbod_completion.blink", name = "Dadbod"}}}, completion = {keyword = {range = "full"}, trigger = {show_on_trigger_character = true, show_on_insert_on_trigger_character = true}, menu = {border = "single", draw = {components = {kind_icon = {text = _2_, ellipsis = false}}}}, documentation = {auto_show = true, window = {border = "single"}}}, signature = {enabled = true, window = {border = "single"}}}, opts_extend = {"default"}, lazy = false}
