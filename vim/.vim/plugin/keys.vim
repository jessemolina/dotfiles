" Vim Key Mappings Plugin
" Organized leader key mappings matching Neovim configuration

" Prevent loading if already loaded or if compatible mode is set
if exists('g:loaded_keys_plugin') || &compatible
  finish
endif
let g:loaded_keys_plugin = 1

" Quick test mapping
nnoremap <leader><leader> :echo 'Double space works!'<CR>

" Help function - show available leader key mappings
function! ShowLeaderHelp()
  echo "Leader Key Mappings:"
  echo ""
  echo "Buffer (b):  bb=last  bd=delete  bs=save  bn=next  bp=prev  bl=list"
  echo "File (f):    ff=find  fs=save    fr=recent  fg=grep  fd=dir   fx=+x"
  echo "Window (w):  ws=split wv=vsplit  wh/j/k/l=nav  wq=close  wo=only"
  echo "Search (s):  sf=find  sb=buffers sg=grep  sw=word  sr=regs  sm=marks"
  echo "Quit (q):    qq=quit  qa=all     qw=save&quit  qQ=force  qr=revert"
  echo "Toggle (T):  Tn=nums  Tw=wrap    Ts=spell  Th=highlight  Tc=cursor"
  echo "Jump (j):    jj=back  jk=forward jm=marks  jl=loclist  jq=quickfix"
  echo ""
  echo "Press <Space>? for this help"
endfunction

nnoremap <leader>? :call ShowLeaderHelp()<CR>

" Smart save function - prompts for filename if buffer has no name
function! SmartSave()
  if empty(expand('%'))
    call inputsave()
    let filename = input('Save as: ')
    call inputrestore()
    if !empty(filename)
      execute 'write ' . filename
    endif
  else
    write
  endif
endfunction

" =============================================================================
" BUFFER OPERATIONS (<leader>b)
" =============================================================================
nnoremap <leader>bb :b#<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bD :bd!<CR>
nnoremap <leader>bs :call SmartSave()<CR>
nnoremap <leader>bS :wa<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bl :buffers<CR>
nnoremap <leader>bx :enew<CR>
nnoremap <leader>by :%y+<CR>
nnoremap <leader>br :e!<CR>
nnoremap <leader>bq :q<CR>
nnoremap <leader>bf :call SmartSave()<CR>

" =============================================================================
" FILE OPERATIONS (<leader>f)
" =============================================================================
nnoremap <leader>ff :find *
nnoremap <leader>fs :call SmartSave()<CR>
nnoremap <leader>fa :wa<CR>
nnoremap <leader>fr :browse oldfiles<CR>
nnoremap <leader>fg :vimgrep // **/*<Left><Left><Left><Left><Left><Left>
nnoremap <leader>fd :e .<CR>
nnoremap <leader>fn :enew<CR>
nnoremap <leader>fx :!chmod +x %<CR>
nnoremap <leader>fq :q<CR>
nnoremap <leader>fQ :qa<CR>

" =============================================================================
" WINDOW MANAGEMENT (<leader>w)
" =============================================================================
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wq :close<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>ww <C-w>p
nnoremap <leader>wx :close<CR>
nnoremap <leader>we <C-w>=
nnoremap <leader>wH :vertical resize -5<CR>
nnoremap <leader>wL :vertical resize +5<CR>
nnoremap <leader>wK :resize +5<CR>
nnoremap <leader>wJ :resize -5<CR>

" =============================================================================
" SEARCH OPERATIONS (<leader>s)
" =============================================================================
nnoremap <leader>sf :find *
nnoremap <leader>sb :buffers<CR>:b 
nnoremap <leader>sg :vimgrep // **/*<Left><Left><Left><Left><Left><Left>
nnoremap <leader>sw :vimgrep /\<<C-r><C-w>\>/ **/*<CR>
nnoremap <leader>sr :registers<CR>
nnoremap <leader>sm :marks<CR>
nnoremap <leader>sl :/
nnoremap <leader>sn :cnext<CR>
nnoremap <leader>sp :cprev<CR>

" =============================================================================
" QUIT OPERATIONS (<leader>q)
" =============================================================================
nnoremap <leader>qq :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>qQ :q!<CR>
nnoremap <leader>qA :qa!<CR>
nnoremap <leader>qw :wq<CR>
nnoremap <leader>qW :wqa<CR>
nnoremap <leader>qd :bd<CR>
nnoremap <leader>qD :bd!<CR>
nnoremap <leader>qr :e!<CR>

" =============================================================================
" TOGGLE OPERATIONS (<leader>T)
" =============================================================================
nnoremap <leader>Tn :set relativenumber!<CR>
nnoremap <leader>Tw :set wrap!<CR>
nnoremap <leader>Ts :set spell!<CR>
nnoremap <leader>Th :set hlsearch!<CR>
nnoremap <leader>Tc :set cursorline!<CR>
nnoremap <leader>Tl :set list!<CR>
nnoremap <leader>Tp :set paste!<CR>
nnoremap <leader>Tm :set mouse=a<CR>
nnoremap <leader>TM :set mouse=<CR>

" =============================================================================
" JUMP/NAVIGATION (<leader>j)
" =============================================================================
nnoremap <leader>jj <C-o>
nnoremap <leader>jk <C-i>
nnoremap <leader>jm :marks<CR>
nnoremap <leader>jl :lopen<CR>
nnoremap <leader>jq :copen<CR>
nnoremap <leader>jn :lnext<CR>
nnoremap <leader>jp :lprev<CR>
nnoremap <leader>jN :cnext<CR>
nnoremap <leader>jP :cprev<CR>