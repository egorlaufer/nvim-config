-- [nfnl] Compiled from fnl/config/plugin/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
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
      cmp.setup({sources = {{name = "conjure"}, {name = "nvim_lsp"}, {name = "buffer"}, {name = "path"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}, {name = "nvim_lua"}}, view = {entries = "native"}, snippet = {expand = _3_}, completion = {completeopt = "menu,menuone,noinsert"}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<C-y>"] = cmp.mapping.confirm({select = true}), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-l>"] = cmp.mapping(_4_, {"i", "s"}), ["<C-h>"] = cmp.mapping(_6_, {"i", "s"})})})
      return cmp.setup.filetype("gitcommit", {sources = {{name = "cmp_git"}, {name = "path"}, {name = "buffer"}, {name = "rg", keyword_length = 5, option = {debounce = 1000}}}})
    else
      return nil
    end
  else
    return nil
  end
end
return {config = config}
