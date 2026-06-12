require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 800,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> · <summary>',

  on_attach = function(bufnr)
    local gs  = package.loaded.gitsigns
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Navigation
    map('n', ']h', gs.next_hunk, 'Next Hunk')
    map('n', '[h', gs.prev_hunk, 'Prev Hunk')

    -- Staging / resetting
    map('n', '<leader>hs', gs.stage_hunk,  'Stage Hunk')
    map('n', '<leader>hr', gs.reset_hunk,  'Reset Hunk')
    map('v', '<leader>hs', function()
      gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
    end, 'Stage Hunk (range)')
    map('v', '<leader>hr', function()
      gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
    end, 'Reset Hunk (range)')
    map('n', '<leader>hS', gs.stage_buffer,       'Stage Buffer')
    map('n', '<leader>hU', gs.reset_buffer_index, 'Unstage Buffer')

    -- Viewing
    map('n', '<leader>hp', gs.preview_hunk,               'Preview Hunk')
    map('n', '<leader>hb', function() gs.blame_line { full = true } end, 'Blame Line')
    map('n', '<leader>hB', gs.toggle_current_line_blame,  'Toggle Inline Blame')
    map('n', '<leader>hd', gs.diffthis,                   'Diff This')
  end,
}
