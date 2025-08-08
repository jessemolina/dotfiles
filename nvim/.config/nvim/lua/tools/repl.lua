local M = {}

-- Get the current Python code block in markdown
local function get_code_block()
  -- First ensure we have the markdown parser
  local has_parser = pcall(vim.treesitter.get_parser, 0, "markdown")
  if not has_parser then
    vim.notify("Markdown treesitter parser not found. Run :TSInstall markdown", vim.log.levels.ERROR)
    return nil
  end
  
  local node = vim.treesitter.get_node()
  if not node then return nil end
  
  -- Walk up the tree to find a code block
  while node do
    local node_type = node:type()
    if node_type == "fenced_code_block" then
      -- Check if it's a Python block by getting the info string
      local info_node = node:field("info_string")[1]
      if info_node then
        local lang = vim.treesitter.get_node_text(info_node, 0)
        -- Remove any extra whitespace and check for python
        lang = lang:gsub("^%s*(.-)%s*$", "%1"):lower()
        if lang == "python" or lang == "py" then
          -- Get the code content
          local code_node = node:field("code")[1]
          if code_node then
            local code_text = vim.treesitter.get_node_text(code_node, 0)
            return code_text
          else
            -- Fallback: get lines between fences
            local start_row, _, end_row, _ = node:range()
            local lines = vim.api.nvim_buf_get_lines(0, start_row + 1, end_row, false)
            -- Remove empty lines at the end
            while #lines > 0 and lines[#lines]:match("^%s*$") do
              table.remove(lines)
            end
            return table.concat(lines, "\n")
          end
        end
      end
    end
    node = node:parent()
  end
  
  return nil
end

-- Alternative: Get code block using regex (fallback)
local function get_code_block_regex()
  local current_line = vim.fn.line('.')
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  
  -- Find the start of the code block
  local start_line = nil
  local end_line = nil
  
  -- Search backwards for ```python
  for i = current_line, 1, -1 do
    if lines[i]:match("^```python") or lines[i]:match("^```py") then
      start_line = i + 1
      break
    end
  end
  
  if not start_line then return nil end
  
  -- Search forwards for closing ```
  for i = start_line, #lines do
    if lines[i]:match("^```") then
      end_line = i - 1
      break
    end
  end
  
  if not end_line then return nil end
  
  -- Extract the code
  local code_lines = {}
  for i = start_line, end_line do
    table.insert(code_lines, lines[i])
  end
  
  return table.concat(code_lines, "\n")
end

-- Send current code block to REPL
function M.send_block()
  local code = get_code_block()
  if not code then
    -- Fallback to regex method
    code = get_code_block_regex()
  end
  
  if code then
    -- Use vim-slime to send the code
    vim.fn["slime#send"](code .. "\n")
    vim.notify("Sent code block to REPL", vim.log.levels.INFO)
  else
    vim.notify("No Python code block found at cursor", vim.log.levels.WARN)
  end
end

-- Send current line to REPL
function M.send_line()
  local line = vim.api.nvim_get_current_line()
  vim.fn["slime#send"](line .. "\n")
end

-- Send visual selection to REPL
function M.send_visual()
  -- Get visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.api.nvim_buf_get_lines(
    0,
    start_pos[2] - 1,
    end_pos[2],
    false
  )
  
  if #lines > 0 then
    -- Handle partial selection on last line
    if end_pos[3] < #lines[#lines] then
      lines[#lines] = lines[#lines]:sub(1, end_pos[3])
    end
    -- Handle partial selection on first line
    if start_pos[3] > 1 then
      lines[1] = lines[1]:sub(start_pos[3])
    end
    
    local code = table.concat(lines, "\n")
    vim.fn["slime#send"](code .. "\n")
  end
end

-- Open iPython in new Zellij pane
function M.open_ipython()
  vim.cmd("!zellij action new-pane -d right -- ipython")
  vim.notify("Opened iPython in right pane", vim.log.levels.INFO)
end

-- Configure Zellij target pane
function M.configure_target()
  -- Prompt for target pane configuration
  vim.ui.input({
    prompt = "Target pane (e.g., 'right', 'down', '2'): ",
    default = vim.g.slime_default_config.relative_pane
  }, function(input)
    if input then
      vim.g.slime_default_config.relative_pane = input
      vim.notify("REPL target set to: " .. input, vim.log.levels.INFO)
    end
  end)
end

-- Create a new Python code block below current line
function M.new_python_block()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local lines = {"", "```python", "", "```", ""}
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
  -- Move cursor inside the code block
  vim.api.nvim_win_set_cursor(0, {row + 3, 0})
  -- Enter insert mode
  vim.cmd("startinsert")
end

-- Create a new Python code block above current line
function M.new_python_block_above()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local lines = {"", "```python", "", "```", ""}
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
  -- Move cursor inside the code block
  vim.api.nvim_win_set_cursor(0, {row + 3, 0})
  -- Enter insert mode
  vim.cmd("startinsert")
end

return M