-- 1) Buffer-local LSP keymaps
local function on_attach(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
  end

  local tb = require("telescope.builtin")
  -- Jumps
  map("n", "gr", tb.lsp_references,   "Find References (Telescope)")
  map("n", "gd", tb.lsp_definitions,  "Go to Definition (Telescope)")
  map("n", "gD", vim.lsp.buf.declaration,       "Go to Declaration")
  map("n", "gi", vim.lsp.buf.implementation,    "Go to Implementation")
  map("n", "gy", vim.lsp.buf.type_definition,   "Go to Type Definition")

  -- Info
  map("n", "K",        vim.lsp.buf.hover,             "Hover")
  map("n", "<C-k>",    vim.lsp.buf.signature_help,    "Signature Help")

  -- Actions
  map("n", "<leader>rn", vim.lsp.buf.rename,            "Rename")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map({ "n", "v" }, "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")

  -- Diagnostics
  map("n", "gl",  vim.diagnostic.open_float, "Line Diagnostics")
  map("n", "[d",  vim.diagnostic.goto_prev,  "Prev Diagnostic")
  map("n", "]d",  vim.diagnostic.goto_next,  "Next Diagnostic")
  map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to Loclist")
end

-- 2) Server discovery
local wanted = { "lua_ls", "pyright", "ruff", "yamlls", "bashls", "ts_ls" }
local function exists(t, x)
  for _, v in ipairs(t) do
    if v == x then return true end
  end
  return false
end

local servers = {}
for _, f in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
  local name = vim.fn.fnamemodify(f, ":t:r")
  if name ~= "init" and exists(wanted, name) then
    local user_cfg = dofile(f) or {}

    -- Merge user config with on_attach
    local cfg = vim.tbl_deep_extend("force", user_cfg, { on_attach = on_attach })

    vim.lsp.config(name, cfg)
    table.insert(servers, name)
  end
end

vim.lsp.enable(servers)
return {}

