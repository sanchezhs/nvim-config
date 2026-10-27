-- lua/plugins/telescope.lua
-- Telescope is kept loaded only because other plugins depend on it
-- (todo-comments -> TodoTelescope, venv-selector, neogit).
-- Primary picker keymaps are served by fzf-lua below.
--
-- NOTE: to enable telescope fzf-native (used by neogit sorter):
-- cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
-- make clean && make
local telescope = require("telescope")

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

pcall(telescope.load_extension, "fzf")

--------------------------------------------------------------------------------
-- fzf-lua: primary picker
--------------------------------------------------------------------------------
local fzf = require("fzf-lua")

fzf.setup({
  -- Enable ripgrep glob parsing in grep pickers.
  -- Allows filtering files from the prompt, e.g.:
  --   foo -- *.lua
  --   foo -- !*.test.js
  --   foo -- -g '*.{ts,tsx}' -g '!**/node_modules/**'
  -- See: https://github.com/ibhagwan/fzf-lua/wiki#how-can-i-send-custom-flags-to-ripgrep-with-live_grep
  grep = {
    rg_glob = true,          -- enable glob parsing
    glob_flag = "--iglob",   -- case-insensitive globs (use "--glob" for case-sensitive)
    glob_separator = "%s%-%-", -- separator pattern: literal " -- " (lua regex)
  },
})

local function map(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc, silent = true })
end

map("<leader>ff", function() fzf.files() end,         "Find files")
map("<leader>fg", function() fzf.live_grep() end,     "Live grep (supports ' -- *.ext' globs)")
map("<leader>fG", function() fzf.live_grep_glob() end, "Live grep (always glob-aware)")
map("<leader>fb", function() fzf.buffers() end,       "Buffers")
map("<leader>fr", function() fzf.oldfiles() end,      "Recent files")
map("<leader>fh", function() fzf.help_tags() end,     "Help tags")
