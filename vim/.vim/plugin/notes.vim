" Simple Note-Taking System for Vim
" Follows the same conventions as Neovim Obsidian setup

if exists('g:loaded_notes_plugin') || &compatible
  finish
endif
let g:loaded_notes_plugin = 1

" Configuration - use separate vim notes directory
let g:notes_directory = expand('~/Documents/vim/notes')
let g:notes_daily_directory = g:notes_directory . '/dailies'

" Ensure directories exist
function! EnsureNotesDirectories()
  call mkdir(g:notes_directory, 'p')
  call mkdir(g:notes_daily_directory, 'p')
endfunction

" =============================================================================
" NOTE ID GENERATION (Zettelkasten format)
" =============================================================================

" Generate note ID with timestamp and slugified title
function! GenerateNoteId(title)
  let timestamp = strftime('%s')
  if empty(a:title)
    " If no title, add 4 random uppercase letters
    let suffix = ''
    for i in range(4)
      let suffix = suffix . nr2char(65 + (localtime() * i) % 26)
    endfor
    return timestamp . '-' . suffix
  else
    " Transform title: spaces->hyphens, remove special chars, lowercase
    let slug = tolower(a:title)
    let slug = substitute(slug, ' ', '-', 'g')
    let slug = substitute(slug, '[^a-z0-9-]', '', 'g')
    return timestamp . '-' . slug
  endif
endfunction

" =============================================================================
" DAILY NOTES
" =============================================================================

" Get daily note path for given date offset
function! GetDailyNotePath(offset)
  let date = strftime('%Y-%m-%d', localtime() + (a:offset * 86400))
  return g:notes_daily_directory . '/' . date . '.md'
endfunction

" Open daily note
function! OpenDailyNote(offset)
  call EnsureNotesDirectories()
  let path = GetDailyNotePath(a:offset)
  execute 'edit ' . path
  
  " If new file, add frontmatter and basic structure
  if !filereadable(path)
    let date = strftime('%Y-%m-%d', localtime() + (a:offset * 86400))
    let content = [
      \ '---',
      \ 'id: "' . date . '"',
      \ 'aliases: []',
      \ 'tags:',
      \ '  - daily',
      \ '---',
      \ '',
      \ '# ' . date,
      \ ''
    \ ]
    call append(0, content)
    normal! 9G$
  endif
endfunction

" =============================================================================
" NOTE CREATION
" =============================================================================

" Create new note with Zettelkasten naming
function! CreateNote()
  call EnsureNotesDirectories()
  call inputsave()
  let title = input('Note title: ')
  call inputrestore()
  
  let note_id = GenerateNoteId(title)
  let filename = note_id . '.md'
  let path = g:notes_directory . '/' . filename
  
  execute 'edit ' . path
  
  " Add frontmatter and title
  let content = [
    \ '---',
    \ 'id: ' . note_id,
    \ 'aliases:',
    \ '  - ' . title,
    \ 'tags:',
    \ '  - ',
    \ '---',
    \ '',
    \ '# ' . (empty(title) ? 'Note ' . note_id : title),
    \ ''
  \ ]
  call append(0, content)
  " Position cursor at the empty tag line
  normal! 6G$
endfunction

" =============================================================================
" NOTE NAVIGATION
" =============================================================================

" Find and open note using simple pattern matching
function! FindNote()
  call EnsureNotesDirectories()
  let pattern = input('Find note: ')
  if empty(pattern)
    return
  endif
  
  " Search in notes directory using glob
  let glob_pattern = g:notes_directory . '/*' . pattern . '*.md'
  let files = glob(glob_pattern, 0, 1)
  
  " Filter out template directories and sort by modification time
  call filter(files, 'filereadable(v:val) && v:val !~ "/templates/"')
  call sort(files, {a, b -> getftime(b) - getftime(a)})
  
  " Limit to 20 results
  let files = files[:19]
  
  if empty(files)
    echo 'No notes found'
    return
  elseif len(files) == 1
    execute 'edit ' . files[0]
  else
    " Show list and let user choose
    echo "Found notes:"
    for i in range(len(files))
      let display_name = fnamemodify(files[i], ':t:r')
      " Try to extract title after timestamp
      if match(display_name, '^\d\+-') == 0
        let display_name = substitute(display_name, '^\d\+-', '', '')
      endif
      echo printf("%2d: %s", i+1, display_name)
    endfor
    call inputsave()
    let choice = input('Select note (1-' . len(files) . '): ')
    call inputrestore()
    if choice >= 1 && choice <= len(files)
      execute 'edit ' . files[choice-1]
    endif
  endif
endfunction

" Follow [[link]] under cursor
function! FollowLink()
  let line = getline('.')
  let col = col('.')
  
  " Find [[link]] pattern around cursor
  let pattern = '\[\[\([^]]\+\)\]\]'
  let start = 0
  while 1
    let match_start = match(line, pattern, start)
    if match_start < 0
      break
    endif
    let match_end = matchend(line, pattern, start)
    if match_start <= col-1 && col-1 < match_end
      " Extract link text
      let link = matchstr(line, pattern, start)
      let link_text = substitute(link, '^\[\[\(.*\)\]\]$', '\1', '')
      call OpenOrCreateNote(link_text)
      return
    endif
    let start = match_end
  endwhile
  
  echo 'No link found under cursor'
endfunction

" Open existing note or create new one
function! OpenOrCreateNote(link_text)
  " Search for existing note with this text in filename using glob
  let search_pattern = substitute(a:link_text, ' ', '*', 'g')
  let glob_pattern = g:notes_directory . '/*' . search_pattern . '*.md'
  let matches = glob(glob_pattern, 0, 1)
  
  " Filter out template directories and get only files
  call filter(matches, 'filereadable(v:val) && v:val !~ "/templates/"')
  
  if !empty(matches)
    execute 'edit ' . matches[0]
  else
    " Create new note
    if confirm('Create new note "' . a:link_text . '"?', "&Yes\n&No") == 1
      let note_id = GenerateNoteId(a:link_text)
      let path = g:notes_directory . '/' . note_id . '.md'
      execute 'edit ' . path
      " Add frontmatter
      let content = [
        \ '---',
        \ 'id: ' . note_id,
        \ 'aliases:',
        \ '  - ' . a:link_text,
        \ 'tags:',
        \ '  - ',
        \ '---',
        \ '',
        \ '# ' . a:link_text,
        \ ''
      \ ]
      call append(0, content)
      normal! 6G$
    endif
  endif
endfunction

" Search content in all notes
function! SearchNotesContent()
  call inputsave()
  let pattern = input('Search in notes: ')
  call inputrestore()
  
  if empty(pattern)
    return
  endif
  
  execute 'silent! vimgrep /' . pattern . '/j ' . g:notes_directory . '/**/*.md'
  if len(getqflist()) > 0
    copen
  else
    echo 'No matches found'
  endif
endfunction

" =============================================================================
" CHECKBOX TOGGLE
" =============================================================================

" Toggle markdown checkbox on current line
function! ToggleCheckbox()
  let line = getline('.')
  let new_line = line
  
  if match(line, '\[ \]') >= 0
    " Unchecked to checked
    let new_line = substitute(line, '\[ \]', '[x]', '')
  elseif match(line, '\[x\]') >= 0
    " Checked to unchecked
    let new_line = substitute(line, '\[x\]', '[ ]', '')
  elseif match(line, '^\s*[-*]\s') >= 0
    " List item without checkbox - add one
    let new_line = substitute(line, '^\(\s*[-*]\s\)', '\1[ ] ', '')
  else
    " No list marker - add one with checkbox
    let new_line = '- [ ] ' . line
  endif
  
  if new_line != line
    call setline('.', new_line)
  endif
endfunction

" =============================================================================
" KEY MAPPINGS
" =============================================================================

" Update help function to include notes
function! ShowNotesHelp()
  echo "Notes Commands:"
  echo ""
  echo "Daily:     ndt=today  ndy=yesterday  ndT=tomorrow"
  echo "Create:    nnn=new note"
  echo "Navigate:  nf=find  ngl=follow link  nsg=search content"
  echo "Edit:      nc=toggle checkbox"
  echo "Browse:    nd=notes directory"
  echo ""
  echo "Link format: [[note title]]"
endfunction

" Add to main help
augroup notes_help
  autocmd!
  autocmd User NotesHelp call ShowNotesHelp()
augroup END

" Daily notes
nnoremap <leader>ndt :call OpenDailyNote(0)<CR>
nnoremap <leader>ndy :call OpenDailyNote(-1)<CR>
nnoremap <leader>ndT :call OpenDailyNote(1)<CR>

" Note operations
nnoremap <leader>nnn :call CreateNote()<CR>
nnoremap <leader>nf :call FindNote()<CR>
nnoremap <leader>ngl :call FollowLink()<CR>
nnoremap <leader>nsg :call SearchNotesContent()<CR>

" Checkbox
nnoremap <leader>nc :call ToggleCheckbox()<CR>

" Quick access to notes directory
nnoremap <leader>nd :execute 'edit ' . g:notes_directory<CR>

" Optional: Help for notes
nnoremap <leader>n? :call ShowNotesHelp()<CR>