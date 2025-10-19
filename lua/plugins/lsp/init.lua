-- ~/.config/nvim/lsp/init.lua
local wanted = { "lua_ls", "pyright", "ruff", "yamlls", "bashls"}

local function exists(t, x) for _, v in ipairs(t) do if v == x then return true end end return false end

local servers = {}
for _, f in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
  local name = vim.fn.fnamemodify(f, ":t:r")
  if name ~= "init" and exists(wanted, name) then
    table.insert(servers, name)
  end
end

vim.lsp.enable(servers)
return {}

