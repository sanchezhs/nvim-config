local function setup_lsd_highlights()
  local function get_hl_color(group, attr)
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    return hl[attr]
  end
  
  local highlights = {
    -- File type colors
    OilDir = { link = "Directory" },
    OilExec = { link = "String" },
    OilArchive = { link = "Error" },
    OilImage = { link = "Constant" },
    OilVideo = { link = "Constant" },
    OilAudio = { link = "Identifier" },
    OilDocument = { link = "Number" },
    OilSource = { link = "Text" },
    OilConfig = { link = "PreProc" },
    OilHidden = { link = "Comment" },
    OilLink = { fg = get_hl_color("Identifier", "fg"), underline = true },
    OilLinkBroken = { fg = get_hl_color("Error", "fg"), underline = true, strikethrough = true },
    OilSpecial = { link = "Special" },
    -- Permission colors (like lsd)
    OilPermissionRead = { fg = get_hl_color("String", "fg") },      -- green for read
    OilPermissionWrite = { fg = get_hl_color("Number", "fg") },     -- yellow for write
    OilPermissionExec = { fg = get_hl_color("Error", "fg") },       -- red for execute
    OilPermissionNone = { fg = get_hl_color("Comment", "fg") },     -- dim for no permission
    -- File type indicator (first char of permissions)
    OilFileTypeDir = { fg = get_hl_color("Directory", "fg"), bold = true },
    OilFileTypeLink = { fg = get_hl_color("Identifier", "fg"), bold = true },
    OilFileTypeFile = { fg = get_hl_color("Comment", "fg") },
    -- Column headers and separators
    OilSize = { link = "Number" },
    OilMtime = { link = "Identifier" },  -- cyan/blue for dates like lsd
    OilPermissions = { link = "Type" },
  }
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

-- Custom permission column that colorizes each permission character
local permission_hlgroups = setmetatable({}, {
  __index = function(t, key)
    local value = {}
    local permission_str = tostring(key)
    -- First character (file type: d, l, -, etc.)
    local file_type = permission_str:sub(1, 1)
    if file_type == "d" then
      table.insert(value, { "OilFileTypeDir", 0, 1 })
    elseif file_type == "l" then
      table.insert(value, { "OilFileTypeLink", 0, 1 })
    else
      table.insert(value, { "OilFileTypeFile", 0, 1 })
    end
    -- Colorize each permission character (rwx pattern repeats 3 times)
    for i = 2, #permission_str do
      local char = permission_str:sub(i, i)
      local pos_in_triplet = ((i - 2) % 3)
      if char == "r" then
        table.insert(value, { "OilPermissionRead", i - 1, i })
      elseif char == "w" then
        table.insert(value, { "OilPermissionWrite", i - 1, i })
      elseif char == "x" or char == "s" or char == "S" or char == "t" or char == "T" then
        table.insert(value, { "OilPermissionExec", i - 1, i })
      else
        table.insert(value, { "OilPermissionNone", i - 1, i })
      end
    end
    t[key] = value
    return value
  end,
})

-- Call this before setting up oil
setup_lsd_highlights()

require("oil").setup({
  default_file_explorer = false,
  use_default_keymaps = true,
  skip_confirm_for_simple_edits = true,
  prompt_save_on_select_new_entry = false,
  columns = {
    "icon",
    {
      "permissions",
      highlight = function(permission_str)
        return permission_hlgroups[permission_str]
      end,
    },
    {
      "size",
      highlight = "OilSize",
    },
    {
      "mtime",
      highlight = "OilMtime",
    },
  },
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
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
  view_options = {
    show_hidden = true,
    natural_order = true,
    sort = { { "type", "asc" }, { "name", "asc" } },
    is_always_hidden = function(name, _)
      return false
    end,
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      local name = entry.name or ""
      local ext = name:match("%.([^%.]+)$") or ""
      
      -- Broken symlink
      if is_link_orphan then
        return "OilLinkBroken"
      end
      
      -- Valid symlink
      if entry.type == "link" or is_link_target then
        return "OilLink"
      end
      
      -- Directories
      if entry.type == "directory" then
        return "OilDir"
      end
      
      -- Hidden files
      if is_hidden or name:sub(1,1) == "." then
        return "OilHidden"
      end
      
      -- Executable files (check permissions)
      if entry.type == "file" and entry.meta and entry.meta.stat then
        local mode = entry.meta.stat.mode
        if mode and (mode % 512 >= 64) then
          return nil
          -- return "OilExec"
        end
      end
      
      -- Archives
      local archive_exts = { zip = true, tar = true, gz = true, bz2 = true, xz = true, 
                            ["7z"] = true, rar = true, tgz = true, tbz2 = true }
      if archive_exts[ext:lower()] then
        return "OilArchive"
      end
      
      -- Images
      local image_exts = { png = true, jpg = true, jpeg = true, gif = true, bmp = true,
                          svg = true, ico = true, webp = true, tiff = true }
      if image_exts[ext:lower()] then
        return "OilImage"
      end
      
      -- Videos
      local video_exts = { mp4 = true, avi = true, mkv = true, mov = true, wmv = true,
                          flv = true, webm = true, m4v = true }
      if video_exts[ext:lower()] then
        return "OilVideo"
      end
      
      -- Audio
      local audio_exts = { mp3 = true, wav = true, flac = true, ogg = true, m4a = true,
                          aac = true, wma = true }
      if audio_exts[ext:lower()] then
        return "OilAudio"
      end
      
      -- Documents
      local doc_exts = { pdf = true, doc = true, docx = true, odt = true, txt = true,
                        rtf = true, md = true, org = true }
      if doc_exts[ext:lower()] then
        return "OilDocument"
      end
      
      -- Source code
      local source_exts = { lua = true, py = true, js = true, ts = true, rs = true,
                           go = true, c = true, cpp = true, h = true, hpp = true,
                           java = true, rb = true, php = true, sh = true, bash = true }
      if source_exts[ext:lower()] then
        return nil
      end
      
      -- Config files
      local config_exts = { json = true, yaml = true, yml = true, toml = true, ini = true,
                           conf = true, cfg = true, xml = true }
      if config_exts[ext:lower()] then
        return "OilConfig"
      end
      
      -- Default for regular files
      return nil
    end,
  },
  float = {
    padding = 2,
    max_width = 0.95,
    max_height = 0.95,
    win_options = { winblend = 0 },
  },
})
