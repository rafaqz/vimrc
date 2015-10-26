"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ VisualSelection
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
" {{{ Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Ranger file choose mode
function! RangerChooser(layout)
  let cmd = printf("silent !ranger --choosefiles=/tmp/chosenfiles %s",
        \ expand("%:p:h"))
  if has("gui_running") && (has("gui_gtk") || has("gui_motif"))
    let cmd = substitute(cmd, '!', '! urxvtr -e ', '')
  endif
  exec cmd
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Quickfix
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ DeleteTrailingWS
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=black guibg=#592929
  autocmd BufEnter * match OverLength /\%82v.*/
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ CommitedFiles
function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list, '')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Grep
" command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)

" " Hide messy Ggrep output and copen automatically
" function! NonintrusiveGitGrep(term)
"   execute "copen"
"   " Map 't' to open selected item in new tab
"   execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
"   execute "silent! Ggrep " . a:term
"   execute "redraw!"
" endfunction

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
" {{{ Map key to toggle opt
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
