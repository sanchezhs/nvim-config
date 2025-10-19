require("lazy").setup({
  -- UI / Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- Status line
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Syntax & textobjects
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  { "tpope/vim-fugitive" },

  -- Smooth scroll
  { "karb94/neoscroll.nvim" },

  -- Greeter
  {
    'nvimdev/dashboard-nvim',
    init = function()
      pcall(require, "user.pickers")
    end,
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- Diagnostics
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },


  -- File navigation
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  -- },

  -- Dired
  { "X3eRo0/dired.nvim",
    dependencies = "MunifTanjim/nui.nvim"
  },

  -- Better Dired?
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  -- {
  --   "refractalize/oil-git-status.nvim",
  --
  --   dependencies = {
  --     "stevearc/oil.nvim",
  --   },
  --
  --   config = true,
  -- },


  -- Mason
  { "williamboman/mason.nvim",
    init = function()
      vim.env.npm_config_cache = vim.env.HOME .. "/.cache/npm"
    end,
    opts = {
      ui = {
        border = "rounded",
        height = 0.85,
        width = 0.8,
      },
    },
    event = { "VeryLazy" },

  },

    -- LSP, completion, snippets
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
  { "neovim/nvim-lspconfig" },

  ui = { border = "rounded" },
})
