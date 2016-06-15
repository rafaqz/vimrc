
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ General

"Shell
set shell=bash
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Sets how many lines of history VIM has to remember
set history=700
" Tags - search down to root to find them.
set tags=./tags;/
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" set dir to current file
autocmd BufEnter * silent! lcd %:p:h

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" No annoying promtps
set shortmess=aoOtI

" Enable filetype plugins
filetype plugin on
filetype indent on

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Movement

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Leader key timeout
set tm=500
"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Layout

set number      " Show line numbers
set cmdheight=1 " Height of the command bar
set hidden      " A buffer becomes hidden when it is abandoned

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Folds

set foldlevelstart=20
set foldcolumn=0
set foldmethod=syntax
set foldnestmax=10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Colors

" 256 color mode
set t_Co=256
colorscheme solarized
set background=dark
" Enable syntax highlighting
syntax enable

" Use terminal background, Allows transparency
" hi Normal guibg=NONE ctermbg=NONE

fun! Highlight_Overlength()
    let blacklist = ['markdown', 'pandoc']
    if index(blacklist, &ft) < 0
      highlight OverLength ctermbg=black guibg=#592929
      match OverLength /\%82v.*/
    endif
endfun

" augroup highlight_overlength
  " autocmd BufEnter * call Highlight_Overlength()
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Status line

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ GUI

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
    set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Search

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Files

" Startup dir
cd ~/Documents

" Turn backup files off
set nobackup
set nowb
set noswapfile

" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" set viminfo^=%

" Put config files in nicer places
set viminfo+=n~/.vim/viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Tab and indents

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab
set ai "Auto indent
set si "Smart indent

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Lines and wrapping
"
" Linebreak on 500 characters
set linebreak
set tw=500

set wrap "Wrap lines
set whichwrap+=<,>,h,l,[,]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Omni complete functions

" set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Highlight

" Last so nothing can overwrite it.
highlight Comment cterm=italic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
