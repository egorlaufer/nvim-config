-- [nfnl] Compiled from fnl/config/plugin/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local mod = ...
local function config(plugin, opts)
  vim.o.completeopt = "menuone,noselect"
  local ok_3f, cmp = nil, nil
  local function _1_()
    return require("cmp")
  end
  ok_3f, cmp = pcall(_1_)
  if ok_3f then
    local ok_3f0, luasnip = nil, nil
    local function _2_()
      return require("luasnip")
    end
    ok_3f0, luasnip = pcall(_2_)
    if ok_3f0 then
      vim.g.nvlime_config = {cmp = {enabled = true}}
      local function _3_(args)
        return luasnip.lsp_expand(args.body)
      end
      local function _4_()
        if luasnip.expand_or_locally_jumpable() then
          return luasnip.expand_or_jump()
        else
          return nil
        end
      end
      local function _6_()
        if luasnip.expand_or_locally_jumpable() then
          return luasnip.expand_or_jump(-1)
        else
          return nil
        end
      end
      cmp.setup({sources = {{name = "conjure"}, {name = "nvim_lsp"}, {name = "buffer"}, {name = "path"}, {name = "rg", keyword_length = 2, option = {debounce = 1000}}, {name = "nvim_lua"}, {name = "vim-dadbod-completion"}}, view = {entries = "native"}, snippet = {expand = _3_}, completion = {completeopt = "menu,menuone,noinsert"}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<C-y>"] = cmp.mapping.confirm({select = true}), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-l>"] = cmp.mapping(_4_, {"i", "s"}), ["<C-h>"] = cmp.mapping(_6_, {"i", "s"})})})
      cmp.setup.filetype("gitcommit", {sources = {{name = "cmp_git"}, {name = "path"}, {name = "buffer"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}}})
      return cmp.setup.filetype("lisp", {sources = {{name = "conjure"}, {name = "nvim_lsp"}, {name = "buffer"}, {name = "path"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}, {name = "nvim_lua"}}})
    else
      return nil
    end
  else
    return nil
  end
end
local function _10_(plugin_12_auto, opts_13_auto)
  local start_14_auto = vim.loop.hrtime()
  local fidget_3f_15_auto, fidget_16_auto = nil, nil
  local function _11_()
    return require("fidget")
  end
  fidget_3f_15_auto, fidget_16_auto = pcall(_11_)
  local ok_3f_17_auto, res_18_auto = pcall(config, plugin_12_auto, opts_13_auto)
  if ok_3f_17_auto then
    if fidget_3f_15_auto then
      local ms_19_auto = ((vim.loop.hrtime() - start_14_auto) / 1000000)
      fidget_16_auto.notify((mod .. " in " .. ms_19_auto .. "ms"))
    else
    end
    return true
  else
    if fidget_3f_15_auto then
      fidget_16_auto.notify(("Failed configuring: " .. mod .. res_18_auto))
    else
      print(("Failed configuring: " .. mod .. res_18_auto))
    end
    return false
  end
end
return {"hrsh7th/nvim-cmp", dependencies = {{"PaterJason/cmp-conjure"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-omni"}, {"hrsh7th/cmp-nvim-lua"}, {"L3MON4D3/LuaSnip"}, {"saadparwaiz1/cmp_luasnip"}}, config = _10_, event = "InsertEnter"}
