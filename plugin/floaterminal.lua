---@diagnostic disable: undefined-doc-param
local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

--- Creates a floating window.
---@param opts table? Options for the floating window.
---@param opts.width number? Width of the window, defaults to 80% of columns.
---@param opts.height number? Height of the window, defaults to 80% of lines.
---@param opts.buf integer? Buffer to use, creates a new one if not provided or invalid.
---@return { buf: integer, win: integer } Buffer and window handles.
local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create the buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define config of the buffer
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded"
  }

  -- Creating the window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

-- Toggles the floating terminal window.
local toggle_term = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floaterm", toggle_term, {})

vim.keymap.set({ "n", "t" }, "<leader>tf", toggle_term)
