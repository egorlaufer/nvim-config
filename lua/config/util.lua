-- [nfnl] Compiled from fnl/config/util.fnl by https://github.com/Olical/nfnl, do not edit.
local function set_key(m, k, command, opts)
  return _G.vim.keymap.set("n", k, command, _G.vim.tbl_extend("force", {noremap = true, silent = true, nowait = true}, opts))
end
local function set_normal(k, command, opts)
  return set_key("n", k, command, opts)
end
local function set_terminal(k, command, opts)
  return set_key("t", k, command, opts)
end
local function set_visual(k, command, opts)
  return set_key("x", k, command, opts)
end
local function telescope(command, opts)
  if ((nil ~= opts) and (nil ~= opts.theme)) then
    return (":Telescope " .. command .. " theme=" .. opts.theme .. "<cr>")
  else
    return (":Telescope " .. command .. "<cr>")
  end
end
local function set_normal_telescope(k, command, opts)
  return set_normal(k, telescope(command, opts), {desc = ("tele " .. command)})
end
return {["set-normal"] = set_normal, ["set-terminal"] = set_terminal, ["set-normal-telescope"] = set_normal_telescope}
