" Vim Help System Plugin
" Custom help for leader key mappings and configuration

if exists('g:loaded_help_plugin') || &compatible
  finish
endif
let g:loaded_help_plugin = 1

" =============================================================================
" HELP SYSTEM
" =============================================================================

function! ShowVimHelp()
  " Create a new buffer for help
  new
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  setlocal nonumber
  setlocal norelativenumber
  setlocal wrap
  setlocal linebreak
  
  " Add help content
  let help_content = [
    \ '*VIM-KEYS-HELP*                                                    vim-keys',
    \ '',
    \ 'Leader key: <Space>                                    Timeout: 1000ms',
    \ '',
    \ '==============================================================================',
    \ 'BUFFER OPERATIONS                                                *buffer-ops*',
    \ '',
    \ '  <leader>bb        Switch to last buffer',
    \ '  <leader>bd        Delete current buffer',
    \ '  <leader>bs        Smart save (prompts if no filename)',
    \ '  <leader>bn        Next buffer',
    \ '  <leader>bp        Previous buffer',
    \ '  <leader>bl        List all buffers',
    \ '  <leader>bx        Create scratch buffer',
    \ '  <leader>by        Yank entire buffer',
    \ '',
    \ 'FILE OPERATIONS                                                    *file-ops*',
    \ '',
    \ '  <leader>ff        Find files (with wildcards)',
    \ '  <leader>fs        Smart save',
    \ '  <leader>fe        File explorer (netrw)',
    \ '  <leader>fv        Vertical file explorer',
    \ '  <leader>fh        Horizontal file explorer',
    \ '  <leader>fd        Edit current directory',
    \ '  <leader>fg        Grep in files',
    \ '  <leader>fr        Recent files',
    \ '  <leader>fx        Make executable',
    \ '',
    \ 'WINDOW MANAGEMENT                                                *window-ops*',
    \ '',
    \ '  <leader>ws        Split horizontally',
    \ '  <leader>wv        Split vertically', 
    \ '  <leader>wh/j/k/l  Navigate windows',
    \ '  <leader>wq        Close window',
    \ '  <leader>wo        Close other windows',
    \ '  <leader>we        Equalize windows',
    \ '  <leader>wH/L      Resize width',
    \ '  <leader>wJ/K      Resize height',
    \ '',
    \ 'SEARCH & NAVIGATION                                              *search-ops*',
    \ '',
    \ '  <leader>sf        Search files',
    \ '  <leader>sb        Search buffers',
    \ '  <leader>sg        Search with grep',
    \ '  <leader>sw        Search word under cursor',
    \ '  <leader>sr        Show registers',
    \ '  <leader>sm        Show marks',
    \ '  <leader>jj        Jump back',
    \ '  <leader>jk        Jump forward',
    \ '  <leader>jq        Open quickfix',
    \ '',
    \ 'QUIT OPERATIONS                                                    *quit-ops*',
    \ '',
    \ '  <leader>qq        Quit',
    \ '  <leader>qa        Quit all',
    \ '  <leader>qw        Save and quit',
    \ '  <leader>qQ        Force quit',
    \ '',
    \ 'TOGGLE OPTIONS                                                   *toggle-ops*',
    \ '',
    \ '  <leader>Tn        Toggle relative numbers',
    \ '  <leader>Tw        Toggle wrap',
    \ '  <leader>Ts        Toggle spell check',
    \ '  <leader>Th        Toggle search highlight',
    \ '  <leader>Tc        Toggle cursor line',
    \ '  <leader>Tl        Toggle list chars',
    \ '  <leader>Tm        Mouse on',
    \ '  <leader>TM        Mouse off',
    \ '',
    \ 'NOTES SYSTEM (if loaded)                                         *notes-ops*',
    \ '',
    \ 'Daily Notes:',
    \ '  <leader>ndt       Today''s daily note',
    \ '  <leader>ndy       Yesterday''s note',
    \ '  <leader>ndT       Tomorrow''s note',
    \ '',
    \ 'Note Management:',
    \ '  <leader>nnn       New note',
    \ '  <leader>nf        Find note',
    \ '  <leader>nd        Notes directory',
    \ '',
    \ 'Link Operations:',
    \ '  <leader>nil       Insert [[link]] (with selector)',
    \ '  <leader>ngl       Follow [[link]] under cursor',
    \ '',
    \ 'Search & Edit:',
    \ '  <leader>nsg       Search in notes content',
    \ '  <leader>nc        Toggle checkbox',
    \ '',
    \ '==============================================================================',
    \ 'NETRW FILE BROWSER                                               *netrw-help*',
    \ '',
    \ 'Access: <leader>fe, <leader>fv, <leader>fh',
    \ '',
    \ 'Navigation:',
    \ '  <Enter>           Open file/directory',
    \ '  -                 Go up directory',
    \ '  u                 Go back in history',
    \ '  gb                Go to bookmark',
    \ '',
    \ 'Display:',
    \ '  i                 Cycle view styles (thin/long/wide/tree)',
    \ '  s                 Select sort style (name/time/size)',
    \ '  r                 Reverse sort order',
    \ '',
    \ 'File Operations:',
    \ '  %                 Create new file',
    \ '  d                 Create directory',
    \ '  R                 Rename file/directory',
    \ '  D                 Delete file/directory',
    \ '  p                 Preview file',
    \ '  v                 Open in vertical split',
    \ '  o                 Open in horizontal split',
    \ '  t                 Open in new tab',
    \ '',
    \ '==============================================================================',
    \ 'CORE VIM ENHANCEMENTS                                            *core-maps*',
    \ '',
    \ 'Enhanced from default vim:',
    \ '  <Esc>             Clear search highlight',
    \ '  CTRL-h            Move to left window',
    \ '  CTRL-j            Move to window below',
    \ '  CTRL-k            Move to window above',
    \ '  CTRL-l            Move to right window',
    \ '',
    \ '==============================================================================',
    \ 'CONFIGURATION                                                        *config*',
    \ '',
    \ 'Files:',
    \ '  ~/.vimrc          Main configuration file',
    \ '  ~/.vim/plugin/    Auto-loaded plugin directory',
    \ '    keys.vim        Leader key mappings',
    \ '    notes.vim       Note-taking system',
    \ '    help.vim        This help system',
    \ '',
    \ 'Settings:',
    \ '  Leader key:       Space',
    \ '  Timeout:          1000ms (1 second)',
    \ '  Line numbers:     Relative + absolute',
    \ '  Mouse:            Enabled',
    \ '  Clipboard:        System clipboard (unnamedplus)',
    \ '',
    \ '==============================================================================',
    \ 'HELP & SUPPORT                                                  *getting-help*',
    \ '',
    \ '  <leader>h         Show this help',
    \ '  <leader>?         Quick help summary',
    \ '  :help topic       Vim''s built-in help system',
    \ '  :help key         Help for specific key',
    \ '  :help :command    Help for ex commands',
    \ '',
    \ 'Examples:',
    \ '  :help CTRL-W      Window commands',
    \ '  :help :substitute Search and replace',
    \ '  :help pattern     Regular expressions',
    \ '',
    \ '==============================================================================',
    \ '',
    \ 'Press q to close this help window',
    \ '',
    \ 'vim:tw=78:ts=8:ft=help:norl:'
  \ ]
  
  call setline(1, help_content)
  setlocal readonly
  setlocal nomodifiable
  setlocal filetype=help
  
  " Map q to close help
  nnoremap <buffer> q :q<CR>
  nnoremap <buffer> <Esc> :q<CR>
  
  " Go to top
  normal! gg
endfunction

" Quick help function for command line
function! ShowLeaderHelp()
  echo "Quick Help: <leader>h for full help"
  echo "Categories: {b}uffer {f}ile {w}indow {s}earch {T}oggle {n}otes {q}uit {j}ump"
  echo "Examples: <leader>fs=save, <leader>fe=file browser, <leader>bs=smart save"
endfunction

" Help mappings
nnoremap <leader>h :call ShowVimHelp()<CR>
nnoremap <leader>? :call ShowLeaderHelp()<CR>

" Command for help
command! Help call ShowVimHelp()
command! QuickHelp call ShowLeaderHelp()