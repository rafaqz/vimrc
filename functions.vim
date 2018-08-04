"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! VisualSelection(direction, extra_filter) " {{{
  " Visual mode searches for the current selection
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
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

fun! DeleteTrailingWS() " {{{
  exe "normal! mz"
  %s/\s\+$//ge
  exe "normal! `z"
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! BufferIsEmpty() " {{{
    if line('$') == 1 && getline(1) == '' 
        return 1
    else
        return 0
    endif
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
function! DeleteEmptyBuffers() " {{{
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction

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
  let path = fnamemodify(a:parent, ':r') . '/'
  let path = input("Dir: ", path, "file")
  let ext = fnamemodify(path, ':e')
  let tail = fnamemodify(path, ':h:t')
  let head = fnamemodify(path, ':h')
  let root = fnamemodify(path, ':t:r')
  if ext == "md"
    call Note(head, root)
  elseif tail == a:child
    call Note(path)
  else
    call Note(path . a:child)
  endif
  call inputrestore()
endfunction

function! Note(dir, ...)
  let path = fnamemodify(a:dir . '/', ':h:r') . '/'

  " Input note name
  if a:0 > 0
    let filename = a:1
  else
    call inputsave()
    let filename = input("Note name: " . path, "", "file")
    call inputrestore()
  endif

  if filename == ""
    return
  endif

  let stem = fnamemodify(filename, ':r')
  if stem == filename
    let filename = filename . ".md"
  endif
  call system('mkdir -p ' . a:dir)
  exec ":edit " . fnameescape(path . filename)


  " Insert Header
  let spaced = substitute(stem, "_", " ", "g")
  let header = substitute(spaced,'\(\<\w\+\>\)', '\u\1', 'g')
  call append(0, [header])
  let underline = ''
  for item in split(header, '\zs')
    let underline .= '='
  endfor
  call append(1, [underline])

endfunction

" function! CitationNote()
"   let extension = g:citation_vim_note_extension
"   let note_dir = g:citation_vim_note_dir
"   let input = expand("<cword>")
"   exec "split " . note_dir . input . "." . extension
"
"   " Insert a header in new files
"   if line('$') == 1 && getline(1) == ''
"     " Add the title.
"     exec "Unite -force-immediately -input=" . input . "  -default-action=append citation/title"
"     normal! 0v$"ly
"
"     " Underline the title as a markdown header.
"     let underline = ''
"     let title=@l
"     for item in split(title, '\zs')
"       let underline .= '='
"     endfor
"     normal! Go
"     call append(1, [underline])
"     normal! Go
"
"     " Add the author, in italics.
"     exec "Unite -force-immediately -input=" . input . "  -default-action=append citation/author"
"     normal! GI*
"     normal! A*
"     exec "Unite -force-immediately -input=" . input . "  -default-action=append citation/date"
"     normal! G2o
"
"   endif
" endfunction
"
" command! CitationNote call CitationNote()

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

function! OpenOperator(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  exec "!xdg-open " . shellescape(@@)
endfunction

function! CropOperator(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  execute "!cropgui " . shellescape(@@)
endfunction

function! GimpOperator(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  execute "!gimp " . shellescape(@@)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Custom Objects
"
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
fun! ConcealToggle() " {{{
  if &conceallevel
    set conceallevel=0
  else
    set conceallevel=2
  endif
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! TabToggle() " {{{
  if &showtabline
    silent set showtabline=0
  else
    silent set showtabline=1
  endif
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! Highlight_Overlength() " {{{
  let bg = execute('set background')
  if bg =~ 'dark'
    highlight OverLength ctermbg=0
  else
    highlight OverLength ctermbg=7
  endif
  match OverLength /\%93v.*/
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! Highlight_EndOfBuffer() " {{{
  let bg = execute('set background')
  if bg =~ 'dark'
    highlight EndOfBuffer ctermfg=0 ctermbg=0
  else
    highlight EndOfBuffer ctermfg=7 ctermbg=7
  endif
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" fun! Highlight_Split() " {{{
"   let bg = execute('set background')
"   if bg =~ 'dark'
"     highlight VertSplit ctermfg=0 ctermbg=0
"     highlight Split ctermfg=0 ctermbg=0
"   else
"     highlight VertSplit ctermfg=7 ctermbg=7
"     highlight Split ctermfg=7 ctermbg=7
"   endif
" endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! MyFoldText() " {{{
  let line = foldtext()
  let sub = substitute(substitute(substitute(line, '+', "\ue0b1", 'g'), 'lines: ', "", 'g'), '─', "", 'g')
  return sub
endfun!
set foldtext=MyFoldText()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! GetFileLine(filename, line) " {{{
  return readfile(a:filename,'',a:line)[a:line-1]
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! ToggleHideAll() " {{{
  exec "AirlineToggle"
  if s:hide_all  == 0
    let s:hide_all = 1
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
    set nonumber
    set showtabline=0
    set foldcolumn=0
    hi FoldColumns ctermbg=none
    hi FoldColumns ctermfg=none
  else
    let s:hide_all = 0
    set showmode
    set ruler
    set showtabline=1
    set laststatus=2
    set showcmd
    set foldcolumn=0
    set number
    hi FoldColumns ctermbg=5
  endif
endfun
let s:hide_all = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! ToggleBackground() " {{{
  silent exec "!i " . &background
  let &background = ( &background == "dark"? "light" : "dark" )
  redraw!
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! TableGrid() " {{{
  let g:table_mode_corner="+"
  let g:table_mode_corner_corner="+"
  let g:table_mode_header_fillchar="="
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
fun! TablePipe() " {{{
  let g:table_mode_corner="|"
  let g:table_mode_corner_corner="|"
  let g:table_mode_header_fillchar="-"
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
