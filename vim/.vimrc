" ==============================================================================
" Table of Contents
" ==============================================================================
" 1. Core Settings
" 2. User Interface
" 3. Text Editing
" 4. System Integration
" 5. Key Mappings
" 6. Command Abbreviations
" 7. Autocommands
" 8. Status Line Configuration
" 9. Plugin Management
" 10. Theme Configuration

" ==============================================================================
" 1. Core Settings
" ==============================================================================

set encoding=utf8 " Set default encoding
set fileencoding=utf8 " Set file encoding
set fileencodings=utf8
set fileformats=unix,dos,mac
set modeline
set modelines=5
set hidden                          " Enable hidden buffers
set ttyfast
set noswapfile
set nobackup
set nowritebackup
set scrolloff=999
filetype plugin indent on " Enable filetype

" ==============================================================================
" 2. User Interface
" ==============================================================================

set number                          " Show line numbers
set relativenumber
set ruler                          " Show cursor position
set foldcolumn=1                   " Add extra margin to the left
set showmatch                      " Show matching brackets
set laststatus=2                   " Always show status line
set splitbelow
set splitright

" Disable GUI scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Fill characters
set fillchars+=eob:\ ,fold:\ ,vert:\│

" ==============================================================================
" 3. Text Editing
" ==============================================================================

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Indentation
set autoindent " Preserve current indent on new lines
set cindent " set C style indent
set expandtab " Convert all tabs typed to spaces
set softtabstop=4 " Indentation levels every four columns
set shiftwidth=4 " Indent/outdent by four columns
set shiftround " Indent/outdent to nearest tabstop

" Line handling
set wrap                           " Wrap lines
set lbr                            " Linebreak
set tw=500                         " TextWidth

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" ==============================================================================
" 4. System Integration
" ==============================================================================

" Clipboard settings
if has('unnamedplus')
    set clipboard=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif

" Shell settings
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/zsh
endif

" ==============================================================================
" 5. Key Mappings
" ==============================================================================

let mapleader="\\"

" Navigation
" Treat long lines as break lines (useful when moving around in them)
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

vnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

" Move to beginning/end of line
nnoremap <silent> H ^
nnoremap <silent> L g_

" Disable arrow and navigation keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Insert mode navigation
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Escaping
inoremap jj <Esc>
cnoremap jj <C-c>
vnoremap v <Esc>

" Buffer navigation
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <leader>c :bd<CR>

" Window navigation
nnoremap <silent> ]w <C-W>w
nnoremap <silent> [w <C-W>W
nnoremap <F2> :split<CR>
nnoremap <F3> :vsplit<CR>

" Tab navigation
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [t :tabprev<CR>

" File and directory handling
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Search
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>; :noh<cr>

" Line movement
nnoremap <S-j> mz:m+<CR>`z
nnoremap <S-k> mz:m-2<CR>`z
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Text manipulation
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" Clipboard operations
nnoremap Y y$
nnoremap D d$
nnoremap YY "+y<CR>
nnoremap <leader>p "+gP<CR>
nnoremap XX "+x<CR>

" Indentation
vnoremap < <gv
vnoremap > >gv

" Misc mappings
nnoremap <CR> :
nnoremap <F1> :setlocal paste!<CR>
nnoremap <silent> <leader>ve :<c-u>e $MYVIMRC<cr>
nnoremap <silent> <leader>vs :<c-u>so $MYVIMRC<cr>
nnoremap <silent> <leader>] :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> <leader>[ :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>
nnoremap <leader>sov :source $MYVIMRC<CR>

" ==============================================================================
" 6. Command Abbreviations
" ==============================================================================

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" ==============================================================================
" 7. Autocommands
" ==============================================================================

augroup restore_pos | au!
    au BufWinEnter *
                \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
                \ |   exe 'normal! g`"zz'
                \ | endif
augroup end

" ==============================================================================
" 8. Status Line Configuration
" ==============================================================================

set statusline=                              " Clear the statusline
set statusline+=%-3.3n\                      " Buffer number
set statusline+=%f\                          " File name
set statusline+=%h%m%r%w                     " Flags
set statusline+=%=                           " Right align
set statusline+=[%{strlen(&ft)?&ft:'none'},  " Filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " Encoding
set statusline+=%{&fileformat}]\             " File format
set statusline+=%16((%l,%c)%)\               " Line and column
set statusline+=%4(%p%{'%'}%)                " Percentage of file

let g:status_padding_left = ""
let g:status_padding_right = ""

set statusline=                                 " clear status line
set statusline+=%{''.g:status_padding_left}     " left padding
set statusline+=\ %F                            " filename
set statusline+=\ [%1*%M%*%n%R%H]               " buffer number and status
set statusline+=%{''.g:status_padding_right}    " left padding
" set statusline+=\ %{''.toupper(mode())}         " INSERT/NORMAL/VISUAL
set statusline+=%=                              " right align remainder
set statusline+=\ %y                            " file type
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)

" ==============================================================================
" 10. Theme Configuration
" ==============================================================================

if has('termguicolors')
  set termguicolors
endif

set background=dark

colorscheme everforest

syntax on
