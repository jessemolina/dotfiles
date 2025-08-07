local M = {}

-- Get the current buffer's filetype
local function get_filetype()
  return vim.bo.filetype
end

-- Run current file based on filetype
function M.run()
  local ft = get_filetype()
  if ft == "go" then
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal go run " .. file)
  elseif ft == "python" then
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal python " .. file)
  elseif ft == "javascript" or ft == "typescript" then
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal node " .. file)
  elseif ft == "rust" then
    vim.cmd("split | terminal cargo run")
  elseif ft == "lua" then
    vim.cmd("source %")
  elseif ft == "sh" or ft == "bash" then
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal bash " .. file)
  else
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal " .. file)
  end
end

-- Get current Go test function name
local function get_go_test_function()
  -- Search backwards from cursor for function definition starting with "Test"
  local func_line = vim.fn.search('^func\\s\\+Test\\w*', 'bcnW')
  if func_line == 0 then
    return nil
  end
  
  -- Get the function name from that line
  local func_text = vim.fn.getline(func_line)
  -- Match: func TestFunctionName(
  local func_name = func_text:match('func%s+(Test%w+)%s*%(')
  if not func_name then
    -- Try without space before parenthesis
    func_name = func_text:match('func%s+(Test%w+)%(')
  end
  
  return func_name
end

-- Run all tests based on filetype
function M.test_all()
  local ft = get_filetype()
  if ft == "go" then
    local current_dir = vim.fn.expand("%:p:h")
    vim.cmd("split | terminal cd " .. current_dir .. "; go test -v ./...")
  elseif ft == "python" then
    vim.cmd("split | terminal python -m pytest")
  elseif ft == "javascript" or ft == "typescript" then
    vim.cmd("split | terminal npm test")
  elseif ft == "rust" then
    vim.cmd("split | terminal cargo test")
  else
    vim.cmd("Neotest run file")
  end
end

-- Run single test (current function/nearest test)
function M.test_single()
  local ft = get_filetype()
  if ft == "go" then
    local func_name = get_go_test_function()
    local current_dir = vim.fn.expand("%:p:h")
    
    if func_name then
      -- Run specific test function in current directory
      vim.cmd("split | terminal cd " .. vim.fn.shellescape(current_dir) .. "; go test -v -run " .. func_name)
    else
      -- Fallback to current package - show debug info
      local current_line = vim.fn.line('.')
      local line_text = vim.fn.getline(current_line)
      vim.cmd("split | terminal cd " .. vim.fn.shellescape(current_dir) .. "; echo 'Debug: No test function found. Current line " .. current_line .. ": " .. line_text .. "'; go test -v .")
    end
  elseif ft == "python" then
    -- Run pytest on current file only
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal python -m pytest " .. file)
  elseif ft == "javascript" or ft == "typescript" then
    -- Run jest on current file
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal npx jest " .. file)
  elseif ft == "rust" then
    -- Run cargo test on current package
    vim.cmd("split | terminal cargo test --lib")
  else
    vim.cmd("Neotest run")
  end
end

-- Build current project based on filetype
function M.build()
  local ft = get_filetype()
  if ft == "go" then
    vim.cmd("split | terminal go build")
  elseif ft == "rust" then
    vim.cmd("split | terminal cargo build")
  elseif ft == "javascript" or ft == "typescript" then
    vim.cmd("split | terminal npm run build")
  else
    vim.cmd("split | terminal make")
  end
end

-- Make executable and run
function M.execute()
  vim.cmd("!chmod +x %; %:p")
end

-- Evaluate/source code based on filetype
function M.eval()
  local ft = get_filetype()
  if ft == "lua" then
    vim.cmd("source %")
  elseif ft == "vim" then
    vim.cmd("source %")
  else
    vim.cmd("normal! vip:lua<CR>")
  end
end

-- Run linter based on filetype
function M.lint()
  local ft = get_filetype()
  if ft == "go" then
    vim.cmd("split | terminal golangci-lint run")
  elseif ft == "python" then
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal flake8 " .. file)
  elseif ft == "javascript" or ft == "typescript" then
    local file = vim.fn.expand("%")
    vim.cmd("split | terminal eslint " .. file)
  elseif ft == "rust" then
    vim.cmd("split | terminal cargo clippy")
  else
    vim.diagnostic.open_float()
  end
end

-- Show documentation based on filetype
function M.docs()
  local ft = get_filetype()
  if ft == "go" then
    vim.cmd("!go doc .")
  elseif ft == "python" then
    vim.cmd("!python -c \"help()\"")
  elseif ft == "rust" then
    vim.cmd("!cargo doc --open")
  else
    vim.lsp.buf.hover()
  end
end

-- Generic compile (fallback to make)
function M.compile()
  vim.cmd("make")
end

return M