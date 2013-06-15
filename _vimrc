set nocompatible

" Vundle
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-surround'
let g:ctrlp_working_path_mode = 0
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'spolu/dwm.vim'
"Bundle 'jiangmiao/auto-pairs'
Bundle 'nono/vim-handlebars'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'

"vim-snipmate deps
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

"CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|bower_components'


" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim

" Basic Settings 
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set t_Co=256
syntax on
set background=dark
colorscheme wombat256mod
set numberwidth=1             " using only 1 column (and 1 space) while possible
set relativenumber
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set noautochdir
set sessionoptions=buffers,tabpages

" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=8             " Keep 8 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set matchtime=2             " (for only .2 seconds).
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=2               " <tab> inserts 4 spaces 
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=manual       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set foldlevelstart=99            " don't fold by default
set splitright
set splitbelow

" Undo/swap
set undodir=./.vim/undo//,$HOME/.vim/undo//,/var/tmp/vim/undo//
set backupdir=./.vim/backup//,$HOME/.vim/backup//,/var/tmp/vim/backup//
set directory=./.vim/swap//,$HOME/.vim/swap//,/var/tmp/vim/swap//
set undofile

" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
"set laststatus=2            " Always show statusline, even if only 1 window.

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set nolist

" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex


let mapleader=","

cabbr %% <C-R>=expand('%:p:h')<CR>

map ; :
noremap ;; ;
nnoremap <F5> :buffers<CR>:buffer<Space>
map <leader>v :tabe ~/.vimrc<CR>
map <leader>V :source $MYVIMRC<CR>
map <leader>wst :w !sudo tee %
map <leader>n :NERDTreeTabsToggle<CR>
nmap <leader>a <Esc>:Ack!
map <leader>rs <ESC>:call ReloadAllSnippets() <CR>
nmap <leader>ss :wa<CR>:mksession! ~/.vim/sessions/
nmap <leader>so :wa<CR>:so ~/.vim/sessions/
nmap <silent> <leader>tp :set paste!<cr>
nnoremap <C-l> :tabn <CR>
nnoremap <C-h> :tabp <CR>
nnoremap <C-L> :tabn <CR>
nnoremap <C-H> :tabp <CR>
map <leader>dcl :%s/^.*console\.log.*\n//gc <CR>
map <leader>ccl :%s/\(^.*\)\(console\.log.*\n\)/\1\/\/\2/gc <CR>
map <leader>b :buffer<Space>
nnoremap <Leader>s :%s/<C-r><C-w>//gic<Left><Left><Left><Left>
nnoremap <Leader>sts :call SetTabStops()<Left>
nmap <leader>cd :lcd %:p:h<cr>
nmap <leader>sar :!sudo /usr/sbin/service apache2 restart<cr>
nnoremap <leader>ln :set relativenumber!<cr>

" DWM plugin
nmap <leader>wf <Plug>DWMFocus 
nmap <leader>wl <Plug>DWMGrowMaster
nmap <leader>wh <Plug>DWMShrinkMaster
nmap <c-,> <Plug>DWMRotateCounterclockwise

" Comments at beginning of line respecting indentation
map ,# :s/^\(\s*\)/\1#/<cr>:noh <cr>
map ,/ :s/^\(\s*\)/\1\/\//<CR>:noh <CR>
map ,> :s/^\(\s*\)/\1> /<CR>:noh <CR>
map ," :s/^\(\s*\)/\1\"/<CR>:noh <CR>
map ,% :s/^\(\s*\)/\1%/<CR>:noh <CR>
map ,! :s/^\(\s*\)/\1!/<CR>:noh <CR>
map ,; :s/^\(\s*\)/\1;/<CR>:noh <CR>
map ,- :s/^\(\s*\)/\1--/<CR>:noh <CR>

map <leader>dhb <ESC>:call DeleteHiddenBuffers() <CR>

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [k :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]k :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [k <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]k <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [k :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]k :call NextIndent(1, 1, 1, 1)<CR>

augroup startup
    " Prevent duplicated autocmds 
    " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
    au!

    au bufwritepost .vimrc source $MYVIMRC
    " close preview window automatically when we move around
    "au CursorMovedI * if pumvisible() == 0|pclose|endif
    "au InsertLeave * if pumvisible() == 0|pclose|endif

    " Filetype settings
    au BufRead,BufNewFIle *.scss setlocal filetype=scss
    au BufRead,BufNewFile *.php setlocal filetype=php.html
    au BufRead,BufNewFile *.coffee setlocal filetype=coffee sw=2 ts=2 sts=2
    au BufRead,BufNewFile *.coffee setlocal filetype=coffee sw=2 ts=2 sts=2
    au BufRead,BufNewFile *.js setlocal sw=2 ts=2 sts=2
    au BufRead,BufNewFile *.hamlpy setlocal filetype=haml sw=4 ts=4 sts=4
    au BufRead,BufNewFile *.py setlocal filetype=pydjango.python

    "autocmd BufEnter * lcd %:p:h
augroup END




function! SetTabStops(num)
    let &l:ts = a:num
    let &l:sts = a:num
    let &l:sw = a:num
endfunction

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction


" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

