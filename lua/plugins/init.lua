require("lazy").setup({
  -- UI / Themes
  { "folke/tokyonight.nvim",   lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim",   lazy = true },
  { "catppuccin/nvim",         name = "catppuccin", lazy = true },
  { "rose-pine/neovim",        name = "rose-pine",  lazy = true },
  { "EdenEast/nightfox.nvim",  lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },

  -- Status line
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
    },
    config = false,
  },

  -- Syntax & textobjects
  { "nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- Git
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Gblame" },
    keys = {
      { "<leader>gs", ":Git<CR>", desc = "Git status" },
      { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff" },
      { "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
    },
  },

  { "lewis6991/gitsigns.nvim" },

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


  -- TODO/FIXME/NOTE highlighting
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
    },
  },

  -- Indentation guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", event = "BufReadPost" },

  -- Marks
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Dired
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },

  -- Auto complete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source
      "hrsh7th/cmp-buffer",    -- Buffer completions
      "hrsh7th/cmp-path",      -- File path completions
      "hrsh7th/cmp-cmdline",   -- Command line completions
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- Formatter
  { "stevearc/conform.nvim" },

  -- Python venv selector
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "neovim/nvim-lspconfig" },
    event = "VeryLazy",
  },

  -- Colorizer
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
  },

  -- Mini
  { 'nvim-mini/mini.nvim', version = '*' },

  { 'tpope/vim-surround' },

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
