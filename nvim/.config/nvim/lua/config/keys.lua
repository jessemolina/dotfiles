local wk = require("which-key")
local builtin = require("telescope.builtin")
local notes = require("plugins.custom.notes")
local harpoon = require("plugins.custom.harpoon")

-- Applications
wk.add({
  { "a", group = "Apps" },
  { "<leader>ab", "<cmd>!zellij action new-pane -- bacon<CR>", desc = "Bacon" },
})

-- Buffer 
wk.add({
  { "<leader>b", group = "Buffer", icon = "󰧾" },
  { "<leader>bb", "<cmd>b#<CR>", desc = "Switch" },
  { "<leader>bd", "<cmd>bd<CR>", desc = "Delete" },
  { "<leader>bD", "<cmd>%bd|e#|bd#<CR>", desc = "Kill All" },
  { "<leader>bn", "<cmd>enew<CR>", desc = "New Buf" },
  { "<leader>bs", "<cmd>w<CR>", desc = "Save" },
  { "<leader>bS", "<cmd>wa<CR>", desc = "Save All" },
  { "<leader>bl", "<cmd>b#<CR>", desc = "Last Buf" },
  { "<leader>bx", "<cmd>enew<CR>", desc = "Scratch" },
  { "<leader>bm", "<cmd>lua vim.cmd('messages')<CR>", desc = "Messages" },
  { "<leader>bi", builtin.buffers, desc = "List" },
  { "<leader>bk", "<cmd>bd!<CR>", desc = "Kill" },
  { "<leader>br", "<cmd>e!<CR>", desc = "Revert" },
  { "<leader>bR", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
  { "<leader>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", desc = "Format" },
  { "<leader>be", "<cmd>lua vim.cmd('%source')<CR>", desc = "Eval" },
  { "<leader>bt", "<cmd>setlocal readonly!<CR>", desc = "Toggle RO" },
  { "<leader>bo", "<cmd>%bd|e#|bd#<CR>", desc = "Kill Others" },
  { "<leader>bc", "<cmd>clone<CR>", desc = "Clone" },
  { "<leader>bu", "<cmd>bnext<CR>", desc = "Unbury" },
  { "<leader>bq", "<cmd>q<CR>", desc = "Quit" },
  { "<leader>bh", "<cmd>lua vim.cmd('earlier')<CR>", desc = "History" },
})

-- Code
wk.add({
  { "<leader>c", group = "Code", icon = "" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Action" },
  { "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", desc = "Format" },
  { "<leader>cg", builtin.lsp_definitions, desc = "Definition" },
  { "<leader>ch", vim.lsp.buf.hover, desc = "Hover" },
  { "<leader>ci", builtin.lsp_document_symbols, desc = "Doc Syms" },
  { "<leader>cn", vim.diagnostic.goto_next, desc = "Next Err" },
  { "<leader>cp", vim.diagnostic.goto_prev, desc = "Prev Err" },
  { "<leader>cs", builtin.lsp_dynamic_workspace_symbols, desc = "Workspace Syms" },
  -- TODO: Add code compile keybindings
})

-- Debug
wk.add({
  { "<leader>d", group = "Debug", icon = "" },
  -- TODO: Add debug keybindings
})

-- Errors
wk.add({
  { "<leader>e", group = "Errors", icon = "" },
  { "<leader>el", vim.diagnostic.setloclist, desc = "To LocList" },
  { "<leader>eq", vim.diagnostic.setqflist, desc = "To Quickfix" },
  { "<leader>en", vim.diagnostic.goto_next, desc = "Next" },
  { "<leader>ep", vim.diagnostic.goto_prev, desc = "Prev" },
  { "<leader>ee", vim.diagnostic.open_float, desc = "Line Diags" },
  { "<leader>ea", builtin.diagnostics, desc = "All Diags" },
  { "<leader>ec", vim.diagnostic.hide, desc = "Clear" },
  { "<leader>es", vim.diagnostic.show, desc = "Show" },
  { "<leader>ew", vim.lsp.buf.workspace_symbol, desc = "Wksp Syms" },
  { "<leader>ef", vim.lsp.buf.code_action, desc = "Fix" },
})

-- Files
wk.add({
  { "<leader>f", group = "Files", icon = "" },
  { "<leader>ff", builtin.find_files, desc = "Find" },
  { "<leader>fg", builtin.live_grep, desc = "Grep" },
  { "<leader>fr", builtin.oldfiles, desc = "Recent" },
  { "<leader>fb", builtin.buffers, desc = "Buffers" },
  { "<leader>fs", "<cmd>w<CR>", desc = "Save" },
  { "<leader>fa", "<cmd>wa<CR>", desc = "Save All" },
  { "<leader>fq", "<cmd>q<CR>", desc = "Quit" },
  { "<leader>fQ", "<cmd>qa<CR>", desc = "Quit All" },
  { "<leader>fx", "<cmd>!chmod +x %<CR>", desc = "+x" },
  { "<leader>fd", "<cmd>e .<CR>", desc = "Dir" },
  { "<leader>fc", "<cmd>cd %:p:h<CR>", desc = "CD" },
  { "<leader>fn", "<cmd>enew<CR>", desc = "New" },
  { "<leader>fR", "<cmd>Rename ", desc = "Rename File" },
  { "<leader>fD", "<cmd>!rm %<CR>", desc = "Delete File" },
})

-- Git
wk.add({
  { "<leader>g", group = "Git", icon = "" },
  { "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
  { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage" },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview" },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset" },
  { "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", desc = "Reset Buf" },
  { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame" },
  { "<leader>gd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff Index" },
  { "<leader>gD", "<cmd>Gitsigns diffthis HEAD<CR>", desc = "Diff HEAD" },
  { "<leader>gh", builtin.git_bcommits, desc = "Buf Commits" },
  { "<leader>gH", builtin.git_commits, desc = "Commits" },
  { "<leader>gl", builtin.git_branches, desc = "Branches" },
  { "<leader>gf", builtin.git_status, desc = "Status" },
  { "<leader>gS", builtin.git_stash, desc = "Stash" },
  { "<leader>gm", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Blame" },
  { "<leader>gx", "<cmd>!git reset --soft HEAD~1<CR>", desc = "Undo Commit" },
  { "<leader>gP", "<cmd>!git push<CR>", desc = "Push" },
  { "<leader>gF", "<cmd>!git pull<CR>", desc = "Pull" },
  { "<leader>ga", "<cmd>!git add .<CR>", desc = "Add All" },
  { "<leader>gc", "<cmd>!git commit -m ''<Left>", desc = "Commit" },
  { "<leader>gA", "<cmd>!git amend<CR>", desc = "Amend" },
})

-- Help
wk.add({
  { "<leader>h", group = "Help", icon = "" },
  { "<leader>hh", builtin.help_tags, desc = "Help" },
  { "<leader>hm", builtin.man_pages, desc = "Man" },
  { "<leader>hk", builtin.keymaps, desc = "Keys" },
  { "<leader>ho", builtin.vim_options, desc = "Opts" },
  { "<leader>hc", builtin.commands, desc = "Cmds" },
  { "<leader>hl", builtin.highlights, desc = "HL Groups" },
  { "<leader>he", builtin.spell_suggest, desc = "Spell" },
  { "<leader>hp", "<cmd>checkhealth<CR>", desc = "Health" },
  -- TODO: Add help keybinds for $VIMRC find, source, and edit.
})

-- Insert
wk.add({
  { "i", group = "Insert" },
})

-- Jump
wk.add({
  { "<leader>j", group = "Jump", icon = "󰑓" },
  { "<leader>jj", "<cmd>normal! ``<CR>", desc = "Last Pos" },
  { "<leader>jm", vim.cmd.marks, desc = "Marks" },
  { "<leader>jl", vim.cmd.lopen, desc = "LocList" },
  { "<leader>jq", vim.cmd.copen, desc = "Quickfix" },
  { "<leader>jn", vim.cmd.cnext, desc = "Next QF" },
  { "<leader>jp", vim.cmd.cprev, desc = "Prev QF" },
  { "<leader>jN", vim.cmd.lnext, desc = "Next Loc" },
  { "<leader>jP", vim.cmd.lprev, desc = "Prev Loc" },
  { "<leader>jd", vim.diagnostic.goto_next, desc = "Next Diag" },
  { "<leader>jD", vim.diagnostic.goto_prev, desc = "Prev Diag" },
  { "<leader>jk", vim.lsp.buf.definition, desc = "Definition" },
  { "<leader>ji", vim.lsp.buf.implementation, desc = "Implementation" },
  { "<leader>jr", vim.lsp.buf.references, desc = "Refs" },
})

-- LSP
wk.add({
  { "<leader>k", group = "LSP", icon = "" },
  { "<leader>kd", vim.lsp.buf.definition, desc = "Def" },
  { "<leader>kD", vim.lsp.buf.declaration, desc = "Decl" },
  { "<leader>ki", vim.lsp.buf.implementation, desc = "Impl" },
  { "<leader>kr", vim.lsp.buf.references, desc = "Refs" },
  { "<leader>kh", vim.lsp.buf.hover, desc = "Hover" },
  { "<leader>ks", vim.lsp.buf.signature_help, desc = "Signature" },
  { "<leader>ka", vim.lsp.buf.code_action, desc = "Action" },
  { "<leader>kn", vim.lsp.buf.rename, desc = "Rename" },
  { "<leader>ke", vim.diagnostic.open_float, desc = "Line Diag" },
  { "<leader>kp", vim.diagnostic.goto_prev, desc = "Prev Diag" },
  { "<leader>kN", vim.diagnostic.goto_next, desc = "Next Diag" },
  { "<leader>kf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
  { "<leader>kw", vim.lsp.buf.workspace_symbol, desc = "Wksp Syms" },
  { "<leader>kq", vim.diagnostic.setloclist, desc = "Diags -> Loc" },
  { "<leader>kx", function() vim.cmd("LspRestart") end, desc = "Restart" },
})

-- Notes 
wk.add({
  { "<leader>n", group = "Notes", icon = "󰏪" },
  { "<leader>nc", "<cmd>ObsidianToggleCheckbox<CR>", desc = "Checkbox" },
  { "<leader>nf", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find Notes" },
  { "<leader>nt", "<cmd>ObsidianTemplate<CR>", desc = "Template" },

  { "<leader>nd", group = "Dailies" },
  { "<leader>ndt", "<cmd>ObsidianToday<CR>", desc = "Today" },
  { "<leader>ndT", "<cmd>ObsidianTomorrow<CR>", desc = "Tomorrow" },
  { "<leader>ndy", "<cmd>ObsidianToday -1<CR>", desc = "Yesterday" },

  { "<leader>ng", group = "Goto" },
  { "<leader>ngl", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link" },
  { "<leader>ngs", "<cmd>ObsidianFollowLink hsplit<CR>", desc = "Split" },
  { "<leader>ngv", "<cmd>ObsidianFollowLink vsplit<CR>", desc = "VSplit" },

  { "<leader>nn", group = "New" },
  { "<leader>nnl", function() notes.new("log") end, desc = "Log" },
  { "<leader>nnn", "<cmd>ObsidianNew<CR>", desc = "Note" },
  { "<leader>nnr", function() notes.new("resource") end, desc = "Resource" },
  { "<leader>nnw", function() notes.new("wiki") end, desc = "Wiki" },

  { "<leader>ns", group = "Search" },
  { "<leader>nsb", "<cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
  { "<leader>nsl", "<cmd>ObsidianLinks<CR>", desc = "Links" },
  { "<leader>nsg", "<cmd>ObsidianSearch<CR>", desc = "Grep" },
  { "<leader>nsr", "<cmd>ObsidianTags<CR>", desc = "Tags" },
})

-- Open 
wk.add({
  { "<leader>o", group = "Open", icon = "󰏌" },
  { "<leader>op", "<cmd>Neotree toggle<CR>", desc = "Explorer" },
  { "<leader>od", "<cmd>DBUIToggle<CR>", desc = "DB UI" },
  { "<leader>oo", "<cmd>Outline<CR>", desc = "Outline" },
})

-- Project
wk.add({
  { "<leader>p", group = "Project", icon = "󰱄" },
  { "<leader>pt", "<cmd>TodoTelescope<CR>", desc = "Todos" },
  { "<leader>pf", builtin.find_files, desc = "Find" },
  { "<leader>pg", builtin.live_grep, desc = "Grep" },
  { "<leader>pb", builtin.buffers, desc = "Buffers" },
  { "<leader>pr", builtin.oldfiles, desc = "Recent" },
  { "<leader>pc", "<cmd>cd %:p:h<CR>", desc = "CD" },
  { "<leader>pn", "<cmd>enew<CR>", desc = "New" },
  -- TODO: Add project keybinds for project management.
})

-- Quit
wk.add({
  { "<leader>q", group = "Quit", icon = "" },
  { "<leader>qq", "<cmd>q<CR>", desc = "Quit" },
  { "<leader>qQ", "<cmd>q!<CR>", desc = "Force Quit" },
  { "<leader>qa", "<cmd>qa<CR>", desc = "Quit All" },
  { "<leader>qA", "<cmd>qa!<CR>", desc = "Force All" },
  { "<leader>qw", "<cmd>wq<CR>", desc = "Save & Quit" },
  { "<leader>qW", "<cmd>wqa<CR>", desc = "Save All & Quit" },
  { "<leader>qd", "<cmd>bd<CR>", desc = "Close Buf" },
  { "<leader>qD", "<cmd>bd!<CR>", desc = "Force Close" },
  { "<leader>qr", "<cmd>e!<CR>", desc = "Revert" },
})

-- Register
wk.add({
  { "<leader>r", group = "Registers", icon = "" },
  { "<leader>ri", harpoon.toggle_telescope, desc = "Show" },
  { "<leader>ra", harpoon.add_file, desc = "Insert" },
  { "<leader>rn", harpoon.next, desc = "Next" },
  { "<leader>rp", harpoon.prev, desc = "Prev" },
  { "<leader>rd", harpoon.remove, desc = "Remove" },
  { "<leader>rD", harpoon.clear_list, desc = "Clear" },
})

-- Search
wk.add({
  { "<leader>s", group = "Search", icon = "" },
  { "<leader>sf", builtin.find_files, desc = "Files" },
  { "<leader>sb", builtin.buffers, desc = "Buffers" },
  { "<leader>sd", builtin.diagnostics, desc = "Diag" },
  { "<leader>sg", builtin.live_grep, desc = "Grep" },
  { "<leader>sh", builtin.help_tags, desc = "Help" },
  { "<leader>sk", builtin.keymaps, desc = "Keymaps" },
  { "<leader>so", builtin.oldfiles, desc = "Recent" },
  { "<leader>sr", builtin.registers, desc = "Regs" },
  { "<leader>sw", builtin.grep_string, desc = "Curr Word" },
  { "<leader>sc", builtin.commands, desc = "Cmds" },
  { "<leader>sm", builtin.marks, desc = "Marks" },
  { "<leader>ss", builtin.spell_suggest, desc = "Spell" },
  { "<leader>sn", builtin.resume, desc = "Resume" },
  { "<leader>st", builtin.treesitter, desc = "TS" },
  { "<leader>sl", builtin.current_buffer_fuzzy_find, desc = "In Buf" },
})

-- Test
wk.add({
  { "<leader>t", group = "Test", icon = "" },
  { "<leader>ta", "<cmd>Neotest attach<CR>", desc = "Attach" },
  { "<leader>tc", "<cmd>Neotest output-panel clear<CR>", desc = "Clear" },
  { "<leader>tk", "<cmd>Neotest output<CR>", desc = "Output" },
  { "<leader>tn", "<cmd>Neotest jump next<CR>", desc = "Next" },
  { "<leader>to", "<cmd>Neotest output-panel toggle<CR>", desc = "Toggle" },
  { "<leader>tp", "<cmd>Neotest jump prev<CR>", desc = "Prev" },
  { "<leader>tr", "<cmd>Neotest run<CR>", desc = "Run" },
  { "<leader>tR", "<cmd>Neotest run file<CR>", desc = "Run File" },
  { "<leader>ts", "<cmd>Neotest summary toggle<CR>", desc = "Summary" },
  { "<leader>tS", "<cmd>Neotest stop<CR>", desc = "Stop" },
})

-- Toggle
wk.add({
  { "<leader>T", group = "Toggle", icon = "" },
  { "<leader>Tn", "<cmd>set relativenumber!<CR>", desc = "Rel Num" },
  { "<leader>Tl", "<cmd>set list!<CR>", desc = "List Chars" },
  { "<leader>Tw", "<cmd>set wrap!<CR>", desc = "Wrap" },
  { "<leader>Ts", "<cmd>set spell!<CR>", desc = "Spell" },
  { "<leader>Th", "<cmd>set hlsearch!<CR>", desc = "Search HL" },
  { "<leader>Tc", "<cmd>set cursorline!<CR>", desc = "Cursorline" },
  { "<leader>Tb", "<cmd>set background=dark<CR>", desc = "Dark Mode" },
  { "<leader>TB", "<cmd>set background=light<CR>", desc = "Light Mode" },
  { "<leader>Tp", "<cmd>set paste!<CR>", desc = "Paste Mode" },
  { "<leader>Tm", "<cmd>set mouse=a<CR>", desc = "Mouse On" },
  { "<leader>TM", "<cmd>set mouse=<CR>", desc = "Mouse Off" },
  { "<leader>Ta", "<cmd>set autoread!<CR>", desc = "Auto Read" },
  { "<leader>Tt", "<cmd>set termguicolors!<CR>", desc = "True Colors" },
  { "<leader>Td", "<cmd>set diff!<CR>", desc = "Diff" },
  { "<leader>Tg", "<cmd>Gitsigns toggle_signs<CR>", desc = "Git Signs" },
})

-- Windows
wk.add({
  { "<leader>w", group = "Window", icon = "" },
  { "<leader>ws", "<cmd>split<CR>", desc = "Split" },
  { "<leader>wv", "<cmd>vsplit<CR>", desc = "VSplit" },
  { "<leader>wd", "<cmd>close<CR>", desc = "Close" },
  { "<leader>wq", "<cmd>q<CR>", desc = "Quit" },
  { "<leader>wo", "<cmd>only<CR>", desc = "Only" },
  { "<leader>wh", "<C-w>h", desc = "Left" },
  { "<leader>wj", "<C-w>j", desc = "Down" },
  { "<leader>wk", "<C-w>k", desc = "Up" },
  { "<leader>wl", "<C-w>l", desc = "Right" },
  { "<leader>wH", "<cmd>vertical resize -5<CR>", desc = "Resize Left" },
  { "<leader>wL", "<cmd>vertical resize +5<CR>", desc = "Resize Right" },
  { "<leader>wK", "<cmd>resize +5<CR>", desc = "Resize Up" },
  { "<leader>wJ", "<cmd>resize -5<CR>", desc = "Resize Down" },
  { "<leader>we", "<cmd>wincmd =<CR>", desc = "Equal" },
  { "<leader>wr", "<C-w>r", desc = "Rotate" },
  { "<leader>wt", "<C-w>T", desc = "To Tab" },
  { "<leader>wm", "<C-w>_|", desc = "Max Width" },
  { "<leader>wM", "<C-w>_", desc = "Max Height" },
})

