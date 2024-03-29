" full vim
set nocompatible " must be the first line

set rtp+=$HOME/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'gmarik/vundle'

    Plugin 'altercation/vim-colors-solarized'
    Plugin 'kien/ctrlp.vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'vim-scripts/The-NERD-tree'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'honza/vim-snippets'
    Plugin 'bling/vim-airline'
    Plugin 'vim-scripts/jsbeautify'
    Plugin 'tpope/vim-surround'
    Plugin 'pangloss/vim-javascript'
    Plugin 'elzr/vim-json.git'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'Raimondi/delimitMate'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'mileszs/ack.vim'
    Plugin 'firegoby/XSLT-Snippets'
    Plugin 'airblade/vim-gitgutter' 
    Plugin 'mhinz/vim-signify'
    Plugin 'veloce/vim-behat'
    Plugin 'heavenshell/vim-jsdoc'
    Plugin 'tpope/vim-cucumber'
    Plugin 'tpope/vim-haml'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'justinj/vim-react-snippets'
    Plugin 'mxw/vim-jsx'
    Plugin 'wavded/vim-stylus'
    Plugin 'isRuslan/vim-es6'
    Plugin 'scrooloose/syntastic'
    Plugin 'vim-fugitive'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'Shougo/vimproc.vim'
    Plugin 'MaxMEllon/vim-jsx-pretty'
    Plugin 'Quramy/tsuquyomi'

    call vundle#end()
"""""""""""""""""
"general settings
filetype plugin indent on
syntax on
syntax enable
let mapleader = ","

set modeline
set modelines=15
set scrolloff=3            " scroll 3 lines before bottom/top
set autoread               " set to auto read when a file is changed from the outside
set autowrite
set showcmd                " display incomplete commands
set hidden                 " allow buffer to be put in the background without saving

set spelllang=en           " set spell check language

set wildmenu               " show autocomplete menus
set wildmode=list:longest,list:full " completion menu behaves more like cli
set wildignore+=*.o,tags,Session.vim

set iskeyword+=$,_         " added word chars

" show line number, cursor position
set number
set ruler
set cursorline             " highlights the cursor line
set nowrap
set linebreak              " this will not break whole words while wrap is enabled
set showbreak=…
set backspace=start,indent,eol " set backspace to act like normal
set encoding=utf-8

" search settings
set hlsearch               " highlight search things
set incsearch              " go to search results as typing
set ignorecase             " ignore case when searching
set smartcase              " but case-sensitive if expression contains a capital letter.
set gdefault               " assume global when searching or substituting
set magic                  " set magic on, for regular expressions
set showmatch              " show matching brackets when text indicator is over them

set ttyfast                " improves redrawing for newer computers
set fileformats=unix,mac,dos

" indent settings
set autoindent
set smartindent

" tab settings
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" be quiet
set visualbell             " don't beep
set noerrorbells           " don't beep
set noeb vb t_vb=          " disable audio and visual bells
au GUIEnter * set vb t_vb=

" do not create swap files!
set nobackup
set nowritebackup
set noswapfile

set pastetoggle=<F7>
set listchars=tab:‣\ ,trail:-,extends:#,nbsp:%,eol:¬
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" vim 7.3 features
if v:version >= 703
    set undodir=$HOME/.vim/.undo
    set undofile
    set undolevels=1000
    set undoreload=10000
    set colorcolumn=120    " show a right margin column
endif


set history=100 " create a larger history

" hide files matching the pattern:
let g:explHideFiles='^\.,.*\.pyc$'

" show editing mode
set showmode

" set the title within xterm as well
set title

" set status line
set laststatus=2
let g:Powerline_symbols='fancy'

" gvim don't display the menu or toolbar
set guioptions-=m
set guioptions-=T

" gvim don't show scrollbars
set guioptions-=r
set guioptions-=L


"""""" colour scheme & fonts
syntax enable
"colorscheme solarized
let g:solarized_termcolors=16
set t_Co=256
set guifont=Ubuntu\ Mono:h12
set background=dark
" colorscheme twilight256if has('gui_running')
"endif

" folding
set foldenable                   " enable folding
set foldmethod=manual            " detect triple-{ style fold markers
set foldlevel=99


"""""""""""""""""
" added filetypes
au BufNewFile,BufRead *.scss set filetype=scss
au BufNewFile,BufRead *.liquid set filetype=html
au BufNewFile,BufRead *.jqt set filetype=html
au BufNewFile,BufRead *.twig set filetype=html
au BufNewFile,BufRead *.cshtml set filetype=html
au BufNewFile,BufRead *.json set filetype=json
au BufNewFile,BufRead *.spv set filetype=php
" Markdown
autocmd BufRead *.md  set ai formatoptions=tcroqn2 nonu comments=n:> ft=markdown
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
" Dokuwiki
autocmd BufRead *.dw  set ai formatoptions=tcroqn2 comments=n:> ft=dokuwiki

autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}


" settings for folding comments
au BufNewFile,BufRead *.cpp,*.c,*.h,*.java,*.js syn region myCComment start="/\*\*" end="\*/" fold keepend transparent


" snipmate
let g:snipMate = { 'snippet_version' : 1 }


""""""""""""""""""""
" keyboard shortcuts
" edit and save .vimrc quickly
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

nnoremap Y y$                  " map Y to match C and D behavior
nmap gy ggVGy                  " yank entire file (global yank)

nnoremap <Space> @q " replay q macro

" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#
" switch search highighting off temporaril
nmap <silent> <leader>/ :nohlsearch<CR>

" save with ,,
inoremap <leader>, <esc>:w<cr>
nnoremap <leader>, :w<cr>

" swaps ' ` for easier bookmark return
nnoremap ' `
nnoremap ` '

" swap ; : for easier commands
nnoremap ; :

" move cursor to next row rather than line. Good when wrapping is on
nnoremap j gj
nnoremap k gk

" save readonly files with w!!
cmap w!! w !sudo tee % >/dev/null


map <leader>w <C-W>w           " fast window switching
map <leader>. :b#<cr>          " cycle between buffers

" Vertical split then hop to new buffer
:noremap <leader>v :vsp<CR>
:noremap <leader>h :split<CR>

" Make current window the only one
:noremap <leader>O :only :tabo<CR>
:noremap <leader>o :only<CR>

" remap going through windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-c>j <c-w>j<c-w>c<c-w>k
map <c-c>k <c-w>k<c-w>c<c-w>j
map <c-c>l <c-w>l<c-w>c<c-w>h
map <c-c>h <c-w>h<c-w>c<c-w>l

"tabs
map <c-t>n :tabnew<cr>
map <c-t>h :tabprevious<cr>
map <c-t>j :tabnext<cr>
map <c-t>c :tabclose<cr>

" folds
:noremap <leader>zz zf%
:noremap <leader>zf f{zf%
:noremap zx za

" error next,previous (ctrl-{n,p})
:noremap <c-n> :cn<cr>
:noremap <c-p> :cp<cr>

" show invisible chars
nmap <silent> <leader>i :set nolist!<CR>


""""""""""""""""
" Plugin settings
" nerd tree
map <leader>d :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nm :NERDTreeMirror<CR>
let g:NERDChristmasTree=1
let g:NERDTreeShowHidden=1

map ,j :call g:Jsbeautify()<cr>:retab<cr>

" ctrlp plugin (because c-p is used for other things)
:noremap <c-f> :CtrlP<cr>
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\node_modules$|\compiled$|\coverage$|\vendor$|cache$',
  \ 'file': '\.exe$\|\.so$\|\.dll$|\.pdf$',
  \ 'link': '',
  \ }
" don't be a dick ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/coverage/*,*/\.git/*

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1 
let g:airline_powerline_fonts = 1


"Syntastic settings
"
if $PATH !~ "\.nvm"
	let $PATH="/Users/paulcurley/.nvm/v4.3.2/bin:" . $PATH
endif
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_auto_loc_list=2 " close location list automatically
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php', 'javascript'],
                           \ 'passive_filetypes': ['html', 'jqt'] }

" surround plugin
autocmd FileType php let b:surround_45 = "<?php \r ?>"

" textmate-ish
nmap ,[ <<
nmap ,] >>
vmap ,[ <gv
vmap ,] >gv
imap ,[ <Esc><<
imap ,] <Esc>>>

nmap ,/ gcc
vmap ,/ gc
imap ,/ <Esc>gcci

nmap ,T :tabnew<CR>
nmap ,{ :tabprev<CR>
nmap ,} :tabnext<CR>


"""""""""""""""
" filetype specific

" remove trailing whitespace
autocmd FileType c,cpp,python,ruby,java,html,twig,css,scss,json,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" format json
autocmd FileType json nmap <leader>f :%!python -m json.tool<cr>
" format xml
command! PrettyXML call DoPrettyXML()

" mustache
autocmd VimEnter,BufNewFile,BufRead *.mustache set nofoldenable

"JavaScript Syntax
let g:javascript_ignore_javaScriptdoc = 1

"[un]escape html
function! HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

map <silent> <Leader>he :call HtmlEscape()<CR>
map <silent> <Leader>hu :call HtmlUnEscape()<CR>

"save on focus lost
:au FocusLost * :wa

" strip all trailing whitespace 
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

"pretty xml
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's
  easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation,
  which is one extra level
  " too deep due to the extra tags we
  wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction

