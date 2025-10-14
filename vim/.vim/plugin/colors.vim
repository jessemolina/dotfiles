" Vim Colors Plugin - Catppuccin Mocha with Black Background
" Based on Neovim catppuccin configuration

if exists('g:loaded_colors_plugin') || &compatible
  finish
endif
let g:loaded_colors_plugin = 1

" Set as default colorscheme
set background=dark

" Color Palette - Catppuccin Mocha with black background override
let s:colors = {
\ 'base':      '#000000',
\ 'mantle':    '#000000', 
\ 'crust':     '#000000',
\ 'surface0':  '#313244',
\ 'surface1':  '#45475a',
\ 'surface2':  '#585b70',
\ 'overlay0':  '#6c7086',
\ 'overlay1':  '#7f849c',
\ 'overlay2':  '#9399b2',
\ 'subtext0':  '#a6adc8',
\ 'subtext1':  '#bac2de',
\ 'text':      '#cdd6f4',
\ 'lavender':  '#b4befe',
\ 'blue':      '#89b4fa',
\ 'sapphire':  '#74c7ec',
\ 'sky':       '#89dceb',
\ 'teal':      '#94e2d5',
\ 'green':     '#a6e3a1',
\ 'yellow':    '#f9e2af',
\ 'peach':     '#fab387',
\ 'maroon':    '#eba0ac',
\ 'red':       '#f38ba8',
\ 'mauve':     '#cba6f7',
\ 'pink':      '#f5c2e7',
\ 'flamingo':  '#f2cdcd',
\ 'rosewater': '#f5e0dc',
\}

" Custom background for code blocks (from nvim config)
let s:code_bg = '#1e1e2e'

" Helper function for setting highlights
function! s:hi(group, fg, bg, attr)
  let l:fg = has_key(s:colors, a:fg) ? s:colors[a:fg] : a:fg
  let l:bg = has_key(s:colors, a:bg) ? s:colors[a:bg] : a:bg
  
  let l:cmd = 'hi ' . a:group
  if !empty(l:fg) && l:fg != 'NONE'
    let l:cmd .= ' guifg=' . l:fg
  endif
  if !empty(l:bg) && l:bg != 'NONE'  
    let l:cmd .= ' guibg=' . l:bg
  endif
  if !empty(a:attr) && a:attr != 'NONE'
    let l:cmd .= ' gui=' . a:attr
  endif
  
  exec l:cmd
endfunction

" Apply colorscheme
function! ApplyCatppuccinColors()
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
  
  " Base UI Elements
  call s:hi('Normal',       'text',      'base',     'NONE')
  call s:hi('Visual',       'NONE',      'surface1', 'NONE')
  call s:hi('Cursor',       'base',      'text',     'NONE')
  call s:hi('CursorLine',   'NONE',      'surface0', 'NONE')
  call s:hi('CursorColumn', 'NONE',      'surface0', 'NONE')
  call s:hi('LineNr',       'overlay1',  'NONE',     'NONE')
  call s:hi('CursorLineNr', 'lavender',  'NONE',     'bold')
  call s:hi('SignColumn',   'overlay1',  'NONE',     'NONE')
  call s:hi('VertSplit',    'surface2',  'NONE',     'NONE')
  call s:hi('Folded',       'overlay2',  'surface0', 'NONE')
  
  " Status Line
  call s:hi('StatusLine',   'text',      'mantle',   'NONE')
  call s:hi('StatusLineNC', 'overlay1',  'mantle',   'NONE')
  
  " Search & Match
  call s:hi('Search',       'base',      'yellow',   'NONE')
  call s:hi('IncSearch',    'base',      'peach',    'NONE')
  call s:hi('MatchParen',   'peach',     'NONE',     'bold')
  
  " Messages
  call s:hi('ErrorMsg',     'red',       'NONE',     'bold')
  call s:hi('WarningMsg',   'yellow',    'NONE',     'bold')
  call s:hi('ModeMsg',      'blue',      'NONE',     'bold')
  
  " Popup Menu
  call s:hi('Pmenu',        'text',      'surface0', 'NONE')
  call s:hi('PmenuSel',     'base',      'blue',     'bold')
  call s:hi('PmenuSbar',    'NONE',      'surface1', 'NONE')
  
  " Syntax Highlighting
  call s:hi('Comment',      'overlay2',  'NONE',     'italic')
  call s:hi('Constant',     'peach',     'NONE',     'NONE')
  call s:hi('String',       'green',     'NONE',     'NONE')
  call s:hi('Number',       'peach',     'NONE',     'NONE')
  call s:hi('Boolean',      'peach',     'NONE',     'NONE')
  
  call s:hi('Identifier',   'flamingo',  'NONE',     'NONE')
  call s:hi('Function',     'blue',      'NONE',     'bold')
  
  call s:hi('Statement',    'mauve',     'NONE',     'bold')
  call s:hi('Conditional',  'red',       'NONE',     'bold')
  call s:hi('Repeat',       'red',       'NONE',     'bold')
  call s:hi('Operator',     'sky',       'NONE',     'NONE')
  call s:hi('Keyword',      'mauve',     'NONE',     'bold')
  
  call s:hi('PreProc',      'pink',      'NONE',     'NONE')
  call s:hi('Include',      'pink',      'NONE',     'bold')
  call s:hi('Define',       'pink',      'NONE',     'NONE')
  
  call s:hi('Type',         'yellow',    'NONE',     'bold')
  call s:hi('Structure',    'yellow',    'NONE',     'NONE')
  
  call s:hi('Special',      'pink',      'NONE',     'NONE')
  call s:hi('Delimiter',    'overlay2',  'NONE',     'NONE')
  
  call s:hi('Error',        'red',       'NONE',     'bold')
  call s:hi('Todo',         'yellow',    'NONE',     'bold')
  
  " Markdown Highlighting
  call s:hi('markdownH1',         'lavender',  'NONE',   'bold')
  call s:hi('markdownH2',         'blue',      'NONE',   'bold')
  call s:hi('markdownH3',         'green',     'NONE',   'bold')
  call s:hi('markdownCode',       'green',     s:code_bg, 'NONE')
  call s:hi('markdownCodeBlock',  'green',     s:code_bg, 'NONE')
  call s:hi('markdownBold',       'maroon',    'NONE',   'bold')
  call s:hi('markdownItalic',     'maroon',    'NONE',   'italic')
  call s:hi('markdownLink',       'blue',      'NONE',   'underline')
  call s:hi('markdownListMarker', 'blue',      'NONE',   'NONE')
  
  " Netrw File Browser
  call s:hi('netrwDir',     'blue',      'NONE',     'bold')
  call s:hi('netrwExe',     'green',     'NONE',     'NONE')
  call s:hi('netrwLink',    'sky',       'NONE',     'underline')
  
  " Git/Diff
  call s:hi('DiffAdd',      'green',     'surface0', 'NONE')
  call s:hi('DiffChange',   'yellow',    'surface0', 'NONE')
  call s:hi('DiffDelete',   'red',       'surface0', 'NONE')
endfunction

" Apply colors automatically
augroup CatppuccinColors
  autocmd!
  autocmd VimEnter * call ApplyCatppuccinColors()
  autocmd ColorScheme * if !exists('g:colors_name') | call ApplyCatppuccinColors() | endif
augroup END

" Apply colors immediately
call ApplyCatppuccinColors()

" Command to reapply colors
command! ReloadColors call ApplyCatppuccinColors()

" Set colors_name so vim knows we have a colorscheme
let g:colors_name = "catppuccin-mocha"