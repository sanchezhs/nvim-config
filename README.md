# Neovim Config

> Neovim 0.12+ · lazy.nvim · Tokyo Night Storm

## Colorschemes

Default: **tokyonight-storm** (set in `lua/plugins/colorscheme.lua`).

To switch, replace the `vim.cmd.colorscheme(...)` call with any of the variants below:

| Theme        | Variants                                                                            |
| -------      | ----------                                                                          |
| `tokyonight` | `tokyonight-night`, `tokyonight-storm`, `tokyonight-day`, `tokyonight-moon`         |
| `kanagawa`   | `kanagawa-wave`, `kanagawa-dragon`, `kanagawa-lotus`                                |
| `catppuccin` | `catppuccin-latte`, `catppuccin-frappe`, `catppuccin-macchiato`, `catppuccin-mocha` |
| `rose-pine`  | `rose-pine`, `rose-pine-moon`, `rose-pine-dawn`                                     |
| `nightfox`   | `nightfox`, `carbonfox`, `duskfox`, `nordfox`, `terafox`                            |
| `gruvbox`    | `gruvbox` (set `vim.o.background = "dark"/"light"` before)                          |

## Keymaps

`<leader>` = `Space`

---

### General

| Key               | Action                          |
| -----             | --------                        |
| `<leader>ww`      | Save file                       |
| `<leader>qq`      | Quit all                        |
| `<leader>h`       | Clear search highlight          |
| `<A-j>` / `<A-k>` | Move line / selection down / up |
| `<C-h/j/k/l>`     | Navigate between splits         |

---

### Files & Navigation

| Key          | Action                         |
| -----        | --------                       |
| `<leader>e`  | Open Oil (file explorer)       |
| `<leader>ff` | Find files (Telescope)         |
| `<leader>fg` | Live grep in project           |
| `<leader>fb` | List open buffers              |
| `<leader>fr` | Recent files                   |
| `<leader>fh` | Search Neovim help             |
| `<leader>ft` | Find TODOs / FIXMEs in project |

---

### LSP (active when a server is attached)

| Key          | Action                       |
| -----        | --------                     |
| `gd`         | Go to definition (Telescope) |
| `gr`         | Find references (Telescope)  |
| `gD`         | Go to declaration            |
| `gi`         | Go to implementation         |
| `gy`         | Go to type definition        |
| `K`          | Hover documentation          |
| `<C-k>`      | Signature help               |
| `<leader>rn` | Rename symbol                |
| `<leader>ca` | Code actions                 |
| `<leader>f`  | Format buffer (LSP)          |
| `gl`         | Line diagnostics (float)     |
| `[d` / `]d`  | Previous / next diagnostic   |
| `<leader>q`  | Send diagnostics to loclist  |

---

### Formatting

| Key          | Action                                     |
| -----        | --------                                   |
| `<leader>cf` | Format with conform.nvim (ruff, prettier…) |

Format-on-save enabled for: Python, JS/TS, JSON, YAML, Markdown, Shell.

---

### Diagnostics — Trouble

| Key          | Action                             |
| -----        | --------                           |
| `<leader>xx` | Project diagnostics                |
| `<leader>xX` | Buffer diagnostics                 |
| `<leader>cs` | Symbol tree                        |
| `<leader>cl` | LSP references / definitions panel |
| `<leader>xL` | Location list                      |
| `<leader>xQ` | Quickfix list                      |

---

### Git — Fugitive

| Key          | Action         |
| -----        | --------       |
| `<leader>gs` | Git status     |
| `<leader>gd` | Git diff split |
| `<leader>gb` | Git blame      |
| `<leader>gc` | Git commit     |
| `<leader>gp` | Git push       |

### Git — Gitsigns (hunk-level)

| Key          | Action                      |
| -----        | --------                    |
| `]h` / `[h`  | Next / previous hunk        |
| `<leader>hs` | Stage hunk                  |
| `<leader>hr` | Reset hunk                  |
| `<leader>hS` | Stage entire buffer         |
| `<leader>hU` | Unstage buffer              |
| `<leader>hp` | Preview hunk                |
| `<leader>hb` | Full blame for current line |
| `<leader>hB` | Toggle inline blame         |
| `<leader>hd` | Diff this file              |

---

### Treesitter Text Objects

Work in visual (`v`) and operator-pending mode (`d`, `c`, `y`…).

| Key | Action |
|-----|--------|
| `if` / `af` | Inner / outer function (across blank lines) |
| `ic` / `ac` | Inner / outer class |
| `ib` / `ab` | Inner / outer block (`if`/`for`/`while`) |

Examples: `vaf` selects whole function, `dif` deletes function body, `caf` replaces the whole function.

| Key | Action |
|-----|--------|
| `<leader>ss` | Swap argument with next |
| `<leader>sS` | Swap argument with previous |

---

### Python

| Key          | Action                |
| -----        | --------              |
| `<leader>cv` | Select virtualenv     |
| `<leader>cV` | Reuse last virtualenv |

---

### TODO Comments

| Key          | Action                          |
| -----        | --------                        |
| `]t` / `[t`  | Next / previous TODO in file    |
| `<leader>ft` | Search all TODOs with Telescope |

Recognised keywords: `TODO`, `FIXME`, `HACK`, `WARN`, `NOTE`, `PERF`.

---

### Oil

| Key     | Action                   |
| -----   | --------                 |
| `-`     | Change to parent dir     |
| `_`     | Open current file dir    |
| `<C-s>` | Open in vertical split   |
| `<C-h>` | Open in horizontal split |
| `<C-p>` | File preview             |
| `<C-c>` | Close Oil                |
| `<C-l>` | Refresh Oil              |
| `<gs>`  | Change order             |
| `<g.>`  | Toggle hidden files      |

---

## Plugin stack

| Plugin                  | Role                                                      |
| --------                | ------                                                    |
| lazy.nvim               | Plugin manager                                            |
| nvim-treesitter (main)  | Syntax highlighting, indentation                          |
| nvim-lspconfig + Mason  | LSP: pyright, ruff, ts_ls, lua_ls, yamlls, jsonls, bashls |
| nvim-cmp + LuaSnip      | Autocompletion                                            |
| conform.nvim            | Format on save                                            |
| Telescope + fzf-native  | Fuzzy finder                                              |
| vim-fugitive            | Git integration                                           |
| gitsigns.nvim           | Git hunk signs in gutter                                  |
| oil.nvim                | Editable file explorer                                    |
| trouble.nvim            | Diagnostics panel                                         |
| todo-comments.nvim      | TODO / FIXME highlighting                                 |
| venv-selector.nvim      | Python virtualenv switcher                                |
| indent-blankline.nvim   | Indentation guides with scope highlight                   |
| mini.pairs + mini.align | Auto-close brackets, text alignment                       |
| vim-surround            | Surround text with `ys`, `cs`, `ds`                       |
| lualine.nvim            | Status line                                               |
