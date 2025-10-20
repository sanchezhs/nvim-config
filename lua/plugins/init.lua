require("lazy").setup({
  -- UI / Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", },

  -- Status line
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Syntax & textobjects
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "ibhagwan/fzf-lua",              -- optional
      "folke/snacks.nvim",             -- optional
    },
  },
  { "ewis6991/gitsigns.nvim" },

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


  -- Marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- File navigation
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  -- },

  -- Dired
  -- { "X3eRo0/dired.nvim",
  --   dependencies = "MunifTanjim/nui.nvim"
  -- },

  -- Dired
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  -- Coq
  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    event = "VeryLazy",
    init = function()
      vim.g.coq_settings = {
        auto_start = "shut-up", -- Start COQ automatically
      }
    end,
    dependencies = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" }, -- 9000+ snippets
      { "ms-jpq/coq.thirdparty", branch = "3p" },      -- Third party sources
    },
  },

  -- Colorizer
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
  },

  -- Mini
  { 'nvim-mini/mini.nvim', version = '*' },

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
