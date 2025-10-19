-- 1) Core (options, keymaps, autocmds)
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- 2) Plugin manager (lazy.nvim bootstrap + setup)
require("config.lazy")

-- 3) Load plugin setups
require("plugins")          -- main plugin spec list
require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.treesiter")
require("plugins.neo-scroll")
require("plugins.dashboard")
require("plugins.trouble")
require("plugins.mason")
-- require("plugins.dired")
require("plugins.oil")
-- require("plugins.oil-git")


-- 4) LSP and completion
require("plugins.lsp")         -- diagnostics, on_attach, mason



