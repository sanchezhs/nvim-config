-- Dired-like file manager with oil.nvim
require("oil").setup({
  default_file_explorer = false,
  use_default_keymaps = true,  -- we will define dired-like mappings below
  skip_confirm_for_simple_edits = true,
  prompt_save_on_select_new_entry = false,

  columns = { "icon", "permissions", "size", "mtime" },

  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },

    -- Make it look/behave like Dired
    view_options = {
    show_hidden = true,                 -- show dotfiles
    natural_order = true,               -- natural sorting
    sort = { { "type", "asc" }, { "name", "asc" } }, -- dirs first, then name
    is_always_hidden = function(name, _)
      -- Keep the parent entry explicit, but you can hide it if you prefer
      return false
    end,
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      local name = entry.name or ""
      -- Hidden files slightly dim
      if is_hidden or name:sub(1,1) == "." then
        return "Comment"
      end
      -- Broken symlink
      if is_link_orphan then
        return "DiagnosticError"
      end
      -- Valid symlink (target exists)
      if entry.type == "link" or is_link_target then
        return "Identifier"
      end
      -- Directories
      if entry.type == "directory" then
        return "Directory"
      end
      -- Everything else (regular files) -> keep theme default (nil) or pick one:
      -- return "Normal"
      return nil
    end,
  },
    --
    -- -- Floating window close to Emacs style popups
    float = {
      padding = 2,
      max_width = 0.95,
      max_height = 0.95,
      win_options = { winblend = 0 },
    },
    --
    -- Dired-like keymaps (buffer-local to oil)
  --   keymaps = {
  --     -- navigation / open
  --     ["<CR>"] = "actions.select",                   -- visit
  --     ["l"]     = "actions.select",                  -- like dired RET
  --     ["s"]     = { "actions.select", opts = { horizontal = true } }, -- open in split
  --     ["v"]     = { "actions.select", opts = { vertical = true } },   -- open in vsplit
  --     ["t"]     = { "actions.select", opts = { tab = true } },        -- open in tab
  --     ["h"]     = "actions.parent",                  -- go to parent
  --     ["^"]     = "actions.parent",                  -- dired ^
  --     ["q"]     = "actions.close",                   -- quit the dired buffer
  --
  --     -- dired-ish extra motions (n/p like Emacs)
  --     ["n"] = function() vim.cmd("normal! j") end,   -- next line
  --     ["p"] = function() vim.cmd("normal! k") end,   -- previous line
  --
  --     -- file operations
  --     ["C"] = "actions.copy",                        -- copy
  --     ["M"] = "actions.move",                        -- move (rename)
  --     ["R"] = "actions.rename",                      -- rename (single)
  --     ["D"] = "actions.delete",                      -- delete
  --     ["+"] = "actions.mkdir",                       -- create directory
  --
  --     -- misc
  --     ["gr"]    = "actions.refresh",                 -- refresh (like dired-g)
  --     ["K"]     = "actions.preview",                 -- quick preview
  --     ["H"]     = "actions.toggle_hidden",           -- toggle dotfiles
  --     ["yy"]    = "actions.copy_entry_path",         -- yank absolute path
  --     ["Y"]     = "actions.copy_relative_path",      -- yank relative path
  --     ["gx"]    = "actions.open_external",           -- open with system app
  --
  --     -- optional: open oil at cwd quickly
  --     ["gc"]    = "actions.open_cwd",
  --     ["gs"] = "actions.change_sort",
  -- }
})

