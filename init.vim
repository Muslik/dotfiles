"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif


let g:vim_bootstrap_langs = "c,html,javascript,php"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim


" Required:
call plug#begin()

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'rhysd/vim-clang-format'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'valloric/youcompleteme'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'honza/vim-snippets'

"*****************************************************************************
" COLOR THEMES
"*****************************************************************************
Plug 'cocopon/iceberg.vim'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ayu-theme/ayu-vim'
"*****************************************************************************
" C
"*****************************************************************************
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

"*****************************************************************************
" HTML
"*****************************************************************************
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'othree/xml.vim'

"*****************************************************************************
" JAVASCRIPT
"*****************************************************************************
Plug 'jelera/vim-javascript-syntax'

"*****************************************************************************
" PHP
"*****************************************************************************
Plug 'arnaud-lb/vim-php-namespace'
call plug#end()

"  ██████╗  █████╗ ███████╗██╗ ██████╗███████╗
"  ██╔══██╗██╔══██╗██╔════╝██║██╔════╝██╔════╝
"  ██████╔╝███████║███████╗██║██║     ███████╗
"  ██╔══██╗██╔══██║╚════██║██║██║     ╚════██║
"  ██████╔╝██║  ██║███████║██║╚██████╗███████║
"  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝╚══════╝
"
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set relativenumber
set binary
set ttyfast
set autoread
set nobackup
set nowritebackup
set noswapfile

"*****************************************************************************
" Fix backspace indent
"*****************************************************************************
set backspace=indent,eol,start

"*****************************************************************************
" TABS
"*****************************************************************************
set tabstop=4
set softtabstop=0
set smarttab
set shiftwidth=4
set noexpandtab


"  ██████╗ ██╗███╗   ██╗██████╗ ███████╗
"  ██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
"  ██████╔╝██║██╔██╗ ██║██║  ██║███████╗
"  ██╔══██╗██║██║╚██╗██║██║  ██║╚════██║
"  ██████╔╝██║██║ ╚████║██████╔╝███████║
"  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
"
"*****************************************************************************
"" Abbreviations
"*****************************************************************************
noremap ff :ClangFormat<CR>
"" no one is really happy until you have this shortcuts
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

let mapleader=','
"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>e :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

imap jj <Esc>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"Map Ctrl + S to save in any mode
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" 2 spaces down
nnoremap 2o o<CR>

" 2 spaces up
nnoremap 2O O<Esc>O

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap j jzz
nnoremap k kzz

" NERD TREE
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"  ██████╗ ██╗     ██╗   ██╗ ██████╗ ███████╗
"  ██╔══██╗██║     ██║   ██║██╔════╝ ██╔════╝
"  ██████╔╝██║     ██║   ██║██║  ███╗███████╗
"  ██╔═══╝ ██║     ██║   ██║██║   ██║╚════██║
"  ██║     ███████╗╚██████╔╝╚██████╔╝███████║
"  ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝
"
"*****************************************************************************
" ALE
"*****************************************************************************
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"*****************************************************************************
" EMMET
"*****************************************************************************
let g:user_emmet_leader_key='<leader>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall
autocmd FileType js,html,css,javascript.jsx setlocal shiftwidth=2 tabstop=2
"*****************************************************************************
" MARKDOWN"
"*****************************************************************************
let vim_markdown_preview_github=1

""*****************************************************************************
"" ULTISNIPS
""*****************************************************************************
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"*****************************************************************************
" NERD TREE
"*****************************************************************************
"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 35
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"  ██╗   ██╗██╗███████╗██╗   ██╗ █████╗ ██╗
"  ██║   ██║██║██╔════╝██║   ██║██╔══██╗██║
"  ██║   ██║██║███████╗██║   ██║███████║██║
"  ╚██╗ ██╔╝██║╚════██║██║   ██║██╔══██║██║
"   ╚████╔╝ ██║███████║╚██████╔╝██║  ██║███████╗
"    ╚═══╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
"
set ruler
set number
let no_buffers_menu=1

let g:dracula_italic = 0
set background=dark
set termguicolors
let ayucolor="dark"
colorscheme ayu
highlight Normal ctermbg=None

set mousemodel=popup
set t_Co=256
set guioptions=egmrti

set laststatus=0
set mouse=a

"" Use modeline overrides
set modeline
set modelines=10
