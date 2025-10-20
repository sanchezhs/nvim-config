local table = {
    [[                                                                              ]],
    [[                                    ██████                                    ]],
    [[                                ████▒▒▒▒▒▒████                                ]],
    [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
    [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
    [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
    [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
    [[                        ██      ██      ████      ████                        ]],
    [[                                                                              ]],
}

require('dashboard').setup {
  theme = 'hyper',
  config = {
    header = table,
    shortcut = {
      {
        icon = '󰊳 ',
        icon_hl = '@property',
        desc = 'Update',
        desc_hl = 'String',
        key = 'u',
        key_hl = 'Number',
        action = 'Lazy update'
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        desc_hl = 'String',
        key = 'f',
        key_hl = 'Number',
        action = 'Telescope find_files',
      },
      {
        icon = ' ',
        icon_hl = 'Number',
        desc = 'Recent Files',
        desc_hl = 'String',
        key = 'r',
        key_hl = 'Number',
        action = 'Telescope oldfiles',
      },
      {
        icon = ' ',
        icon_hl = 'Identifier',
        desc = 'Projects',
        desc_hl = 'String',
        key = 'p',
        key_hl = 'Number',
        action = 'Telescope projects',
      },
      {
        icon = ' ',
        icon_hl = 'Number',
        desc = 'Dotfiles',
        desc_hl = 'String',
        key = 'd',
        key_hl = 'Number',
        action = function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("$HOME/.config"),
            hidden = true,
            no_ignore = true,
            follow = true,
            prompt_title = "Dotfiles"
          })
        end,
      },
    },
    footer = {},
  },
  hide = {
    statusline = false,
    tabline = false,
    winbar = false,
  },
}
