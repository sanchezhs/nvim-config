require('dashboard').setup {
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("$HOME/.config"), hidden = true, no_ignore = true, follow = true, prompt_title = "Dotfiles" }) end,
        key = 'd',
      },
    },
  },
}
