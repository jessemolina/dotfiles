" Vim File Selector Plugin
" Simple telescope-like file selection for vim
" Focused on note linking functionality

if exists('g:loaded_selector_plugin') || &compatible
  finish
endif
let g:loaded_selector_plugin = 1

" =============================================================================
" CORE SELECTOR FUNCTIONS
" =============================================================================

" Filter files based on search query (fuzzy matching)
function! FilterFiles(files, query)
  if empty(a:query)
    return a:files
  endif
  
  let query_lower = tolower(a:query)
  let filtered = []
  
  for file_info in a:files
    let name_lower = tolower(file_info.display_name)
    
    " Simple fuzzy matching - check if all characters in query appear in order
    let query_pos = 0
    let found = 1
    
    for char in split(query_lower, '\zs')
      let char_pos = stridx(name_lower, char, query_pos)
      if char_pos == -1
        let found = 0
        break
      endif
      let query_pos = char_pos + 1
    endfor
    
    if found
      call add(filtered, file_info)
    endif
  endfor
  
  return filtered
endfunction

" Main selector function with search capability
function! ShowSelector(directory, pattern, title)
  " Expand and normalize the directory path
  let dir_path = expand(a:directory)
  
  if !isdirectory(dir_path)
    echo 'Directory does not exist: ' . dir_path
    return {}
  endif
  
  " Use glob() instead of system find for better reliability
  let glob_pattern = dir_path . '/' . a:pattern
  let files = glob(glob_pattern, 0, 1)
  
  " Filter to only files (not directories)
  call filter(files, 'filereadable(v:val)')
  
  " Sort by modification time (newest first)
  call sort(files, {a, b -> getftime(b) - getftime(a)})
  
  if empty(files)
    echo 'No files found matching: ' . glob_pattern
    return {}
  endif
  
  " Build file info list with clean display names
  let file_infos = []
  
  for filepath in files
    let display_name = fnamemodify(filepath, ':t:r')
    
    " Clean up timestamp prefix for notes (e.g., "1234567-title" -> "title")
    if match(display_name, '^\d\+-') == 0
      let clean_name = substitute(display_name, '^\d\+-', '', '')
      if !empty(clean_name)
        let display_name = clean_name
      endif
    endif
    
    call add(file_infos, {'path': filepath, 'name': display_name, 'display_name': display_name})
  endfor
  
  " Interactive search and selection
  return SelectWithSearch(file_infos, a:title)
endfunction

" Interactive selector with search functionality
function! SelectWithSearch(file_infos, title)
  let search_query = ''
  let filtered_files = a:file_infos
  
  while 1
    " Clear screen area and show current results
    redraw
    
    " Show title and search prompt
    echo a:title
    echo 'Search (Enter to select, Esc to cancel): ' . search_query
    echo ''
    
    " Show filtered results
    if empty(filtered_files)
      echo 'No matches found'
      echo ''
    else
      for i in range(min([len(filtered_files), 10]))  " Show max 10 results
        echo printf("%2d. %s", i+1, filtered_files[i].display_name)
      endfor
      if len(filtered_files) > 10
        echo '... and ' . (len(filtered_files) - 10) . ' more'
      endif
      echo ''
    endif
    
    " Get user input
    echo 'Type to search, number to select, Enter for #1, Esc to cancel'
    let char = getchar()
    let input = nr2char(char)
    
    " Handle different inputs
    if char == 27  " Esc key
      redraw
      echo 'Selection cancelled'
      return {}
    elseif char == 13  " Enter key
      if !empty(filtered_files)
        redraw
        echo 'Selected: ' . filtered_files[0].display_name
        return filtered_files[0]
      endif
    elseif char == 8 || char == 127  " Backspace
      if !empty(search_query)
        let search_query = search_query[:-2]
        let filtered_files = FilterFiles(a:file_infos, search_query)
      endif
    elseif input =~ '[0-9]' && !empty(filtered_files)
      let choice = str2nr(input)
      if choice >= 1 && choice <= len(filtered_files) && choice <= 10
        redraw
        echo 'Selected: ' . filtered_files[choice-1].display_name
        return filtered_files[choice-1]
      endif
    elseif input =~ '[a-zA-Z ]'  " Letters and spaces
      let search_query = search_query . input
      let filtered_files = FilterFiles(a:file_infos, search_query)
    endif
  endwhile
endfunction

" =============================================================================
" NOTES-SPECIFIC SELECTOR FUNCTIONS
" =============================================================================

" Select a note file and return info about it
function! NotesSelector()
  " Get notes directory from notes.vim if available
  let notes_dir = exists('g:notes_directory') ? g:notes_directory : expand('~/Documents/vim/notes')
  
  " Ensure directory exists
  if !isdirectory(notes_dir)
    echo 'Notes directory does not exist: ' . notes_dir
    echo 'Create it first or check your notes.vim configuration'
    return {}
  endif
  
  return ShowSelector(notes_dir, '*.md', 'Select a note:')
endfunction

" Insert [[note-link]] at cursor position
function! InsertNoteLink()
  let selection = NotesSelector()
  
  if empty(selection) || type(selection) != type({})
    echo 'No note selected'
    return
  endif
  
  " Validate selection has required fields
  if !has_key(selection, 'name') || empty(selection.name)
    echo 'Invalid selection - missing name'
    return
  endif
  
  " Insert [[link]] at cursor position
  let link_text = '[[' . selection.name . ']]'
  
  " Get current position and insert in insert mode
  let pos = getpos('.')
  execute 'normal! a' . link_text
  
  echo 'Inserted link: ' . link_text
endfunction

" Select note and open it
function! SelectAndOpenNote()
  let selection = NotesSelector()
  
  if empty(selection)
    return
  endif
  
  execute 'edit ' . selection.path
  echo 'Opened: ' . selection.name
endfunction

" =============================================================================
" GENERAL FILE SELECTOR FUNCTIONS
" =============================================================================

" Select any file from current directory
function! FileSelector()
  let current_dir = getcwd()
  return ShowSelector(current_dir, '*', 'Select a file:')
endfunction

" Select and open any file
function! SelectAndOpenFile()
  let selection = FileSelector()
  
  if empty(selection)
    return
  endif
  
  execute 'edit ' . selection.path
  echo 'Opened: ' . selection.name
endfunction

" =============================================================================
" KEY MAPPINGS
" =============================================================================

" Notes selector mappings  
nnoremap <leader>nil :call InsertNoteLink()<CR>

" General file selector mappings
nnoremap <leader>fsl :call SelectAndOpenFile()<CR>