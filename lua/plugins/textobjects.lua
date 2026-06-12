local sel = require("nvim-treesitter-textobjects.select")

local function map(lhs, capture)
  vim.keymap.set({ "x", "o" }, lhs, function()
    sel.select_textobject(capture, "textobjects")
  end, { silent = true, desc = capture })
end

map("af", "@function.outer")
map("if", "@function.inner")
map("ac", "@class.outer")
map("ic", "@class.inner")
map("ab", "@block.outer")
map("ib", "@block.inner")

