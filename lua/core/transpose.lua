-- Transpose (swap) words — Emacs M-t style
local M = {}

-- First word starting at or after pos (1-indexed). Returns s, e or nil.
local function word_forward(line, pos)
  local s = pos
  while s <= #line and not line:sub(s, s):match("%w") do
    s = s + 1
  end
  if s > #line then return nil end
  local e = s
  while e < #line and line:sub(e + 1, e + 1):match("%w") do
    e = e + 1
  end
  return s, e
end

-- Last word ending at or before pos (1-indexed). Returns s, e or nil.
local function word_backward(line, pos)
  local e = pos
  while e >= 1 and not line:sub(e, e):match("%w") do
    e = e - 1
  end
  if e < 1 then return nil end
  local s = e
  while s > 1 and line:sub(s - 1, s - 1):match("%w") do
    s = s - 1
  end
  return s, e
end

local function swap_words(line, w1s, w1e, w2s, w2e)
  return line:sub(1, w1s - 1)
    .. line:sub(w2s, w2e)
    .. line:sub(w1e + 1, w2s - 1)
    .. line:sub(w1s, w1e)
    .. line:sub(w2e + 1)
end

function M.swap_next()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  col = col + 1  -- 0→1 indexed

  local w1s, w1e = word_forward(line, col)
  if not w1s then vim.notify("No word under cursor", vim.log.levels.WARN); return end
  local w2s, w2e = word_forward(line, w1e + 1)
  if not w2s then vim.notify("No next word on this line", vim.log.levels.WARN); return end

  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { swap_words(line, w1s, w1e, w2s, w2e) })
  vim.api.nvim_win_set_cursor(0, { row, w1s - 1 })
end

function M.swap_prev()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  col = col + 1

  local w2s, w2e = word_backward(line, col)
  if not w2s then vim.notify("No word under cursor", vim.log.levels.WARN); return end
  local w1s, w1e = word_backward(line, w2s - 1)
  if not w1s then vim.notify("No previous word on this line", vim.log.levels.WARN); return end

  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { swap_words(line, w1s, w1e, w2s, w2e) })
  vim.api.nvim_win_set_cursor(0, { row, w1s - 1 })
end

return M
