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

-- 2) Server setup — per-server config in lua/plugins/lsp/<name>.lua (optional)
local wanted = { "lua_ls", "pyright", "ruff", "yamlls", "jsonls", "bashls", "ts_ls" }

for _, name in ipairs(wanted) do
  local ok, user_cfg = pcall(require, "plugins.lsp." .. name)
  local cfg = vim.tbl_deep_extend("force", ok and user_cfg or {}, { on_attach = on_attach })
  vim.lsp.config(name, cfg)
end

vim.lsp.enable(wanted)
return {}

