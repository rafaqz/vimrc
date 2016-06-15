"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{Search Visual Selection

" Visual mode searches for the current selection
function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ack \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ DeleteTrailingWS
function! DeleteTrailingWS()
  exe "normal! mz"
  %s/\s\+$//ge
  exe "normal! `z"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Customize Tabline
function! CustomizedTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let s .= i . ':'
        let s .= '%*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let file = bufname(buflist[winnr - 1])
        let file = fnamemodify(file, ':p:t')
        if file == ''
            let file = '[No Name]'
        endif
        let s .= file
        let s .= ' '
        let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
endfunction

" Always show the tabline
set stal=2
set tabline=%!CustomizedTabLine()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Notes
function! NoteSubDir(parent)
  call inputsave()
  let path = input("Dir: ", a:parent, "dir")
  call inputrestore()

  call Note(path)
endfunction

function! NoteMidDir(parent,child)
  call inputsave()
  let path = fnamemodify(a:parent, 'h:r') . '/'
  let path = input("Dir: ", path, "dir") 
  let path = fnamemodify(path, 'h:r') . a:child
  call inputrestore()

  call Note(path)
endfunction

function! Note(dir, ...)
  call system('mkdir -p ' . a:dir)
  let path = fnamemodify(a:dir, 'h:r') . '/'

  " Input note name
  if a:0 > 0
    let name = a:1
  else
    call inputsave()
    let name = input("Note name: " . path, "", "file")
    call inputrestore()
  endif

  if fnamemodify(name, ':r') == name
    let filename = name . ".md"
  endif
  exec ":edit " . fnameescape(path . filename)

  " Insert Header
  let spaced = substitute(name, "_", " ", "g")
  let header = substitute(spaced,'\(\<\w\+\>\)', '\u\1', 'g')
    
  call append(0, [header])
  let underline = ''
  for item in split(header, '\zs')
    let underline .= '='
  endfor
  call append(1, [underline])

endfunction

function! CitationNote()
  let extension = g:citation_vim_note_extension
  let note_dir = g:citation_vim_note_dir
  let input = expand("<cword>")
  exec "split " . note_dir . input . "." . extension

  " Insert a header in new files 
  if line('$') == 1 && getline(1) == '' 
    " Add the title.
    exec "Unite -force-immediately -input=" . input . "  -default-action=append citation/title"
    normal! 0v$"ly

    " Underline the title as a markdown header.
    let underline = ''
    let title=@l
    for item in split(title, '\zs')
      let underline .= '='
    endfor
    normal! Go
    call append(1, [underline])
    normal! Go

    " Add the author, in italics.
    exec "Unite -force-immediately -input=" . input . "  -default-action=append citation/author"
    normal! GI*
    normal! A*
    exec "Unite -force-immediately -input=" . input . "  -default-action=append citation/date"
    normal! G2o

  endif
endfunction

command! CitationNote call CitationNote()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Quitting whether Goyo is active or not
" ca <silent> wq :w<cr>:call Quit()<cr>
" ca <silent> q :call Quit()<cr>
nnoremap <silent>ZZ :call Goyoquit()<cr>
function! Goyoquit()
    Goyo!
    quit
endfunction

function! ReGoyo()
  if exists('#goyo')
    Goyo!
    Goyo
  endif
endfunction
command! ReGoyo call ReGoyo()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ StarDict direct calls (plugin wont pass args)
function! SDCV(word)
    Goyo!
    " Get the bytecode.
    let bytecode = system("sdcv " . a:word)

    " Open a new split and set it up.
    if bufexists('__StarDict__')
      sbuffer __StarDict__
    else
      split __StarDict__
    endif

    normal! ggdG
    setlocal filetype=stardict
    setlocal buftype=nofile

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
    normal! gg
    Goyo
endfunction
command! -nargs=1 Sdcv call SDCV(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Custom Operators
nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@

function! OpenOperator(type)
  if a:type ==# 'v'
      normal! `<v`>y
  elseif a:type ==# 'char'
      normal! `[v`]y
  else
      return
  endif

  exec "Start! xdg-open " . shellescape(@@)
endfunction

function! CropOperator(type)
  if a:type ==# 'v'
      normal! `<v`>y
  elseif a:type ==# 'char'
      normal! `[v`]y
  else
      return
  endif

  execute "Start! cropgui " . shellescape(@@)
endfunction

function! GimpOperator(type)
  if a:type ==# 'v'
      normal! `<v`>y
  elseif a:type ==# 'char'
      normal! `[v`]y
  else
      return
  endif

  execute "Start! gimp " . shellescape(@@)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Custom Objects
call textobj#user#plugin('file', {
\   'file': {
\     'pattern': '\f\+', 
\     'select': ['af', 'if']
\   }
\ })

call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'al',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'il',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ ConcealToggle
function! ConcealToggle()
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=2
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
