-- 1) Core (options, keymaps, autocmds)
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- 2) Plugin manager
require("config.lazy")

-- 3) Load plugin setups
require("plugins")

require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.treesiter")
require("plugins.neo-scroll")
require("plugins.dashboard")
require("plugins.trouble")
require("plugins.mason")
require("plugins.oil")
require("plugins.neogit")
require("plugins.colorizer")
require("plugins.mini-surround")
require("plugins.gitsigns")
require("plugins.marks")


-- 4) LSP and completion
require("plugins.lsp")
