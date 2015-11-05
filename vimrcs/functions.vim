"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
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
" {{{ Ranger

function! Ranger(path)
  let cmd = printf("silent !ranger --choosefiles=/tmp/chosenfiles %s",
        \ expand("%:p:h") . "/" . a:path)
  if has("gui_running") && (has("gui_gtk") || has("gui_motif"))
    let cmd = substitute(cmd, '!', '! urxvtr -e ', '')
  endif
  exec cmd
endfunction

function! RangerChooser(layout)
  exec Ranger("")
  if filereadable('/tmp/chosenfiles')
    let chosenfiles = system('cat /tmp/chosenfiles')
    let splitfiles = split(chosenfiles, "\n")
    for filename in splitfiles
      exec a:layout . " " . filename
    endfor
    call system('rm /tmp/chosenfiles')
  endif
  redraw!
endfunction

function! RangerPaste(key) " a or i
  let save_cursor = getpos(".")
  call Ranger("")
  call setpos('.', save_cursor)
  if filereadable('/tmp/chosenfiles')
    " Load filename, remove trailing null char
    let result = substitute(system('cat /tmp/chosenfiles'), "\n*$", '', '')
    " Insert or append
    exe "normal " . a:key . result . "\<Esc>" 
    call system('rm /tmp/chosenfiles')
  endif
  redraw!
endfun

function RangerOpenFolder(app, object)
  exec "lcd %:p:h"
  exec "normal yi" . a:object
  let path = @0
  let dir = fnamemodify(path, ':h')
  call Ranger(dir)
  if filereadable('/tmp/chosenfiles')
    " Load filename, remove trailing null char
    let result = substitute(system('cat /tmp/chosenfiles'), "\n*$", '', '')
    exec "normal di" . a:object . "P"
    call system('rm /tmp/chosenfiles')
  endif
  redraw!
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Open files externally
function OpenFile(app, object)
  exec "lcd %:p:h"
  exec "normal yi" . a:object
  let path = @0
  exec "Start! " . a:app . " " . path
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ DeleteTrailingWS
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
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
