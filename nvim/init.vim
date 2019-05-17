"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:
"       Dzhabrail Marhiev
"
" Version:
"       1.0 - 23.12.2018 00:14:03
"
" Sections:
"    -> General
"    -> Text, tab and indent related
"    -> Editing mappings
"    -> Plugin mappings
"    -> Moving around, tabs and buffers
"    -> VIM user interface
"    -> Files and backups
"    -> Colors and Fonts
"    -> Useful Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source ~/dotfiles/nvim/plugins.vim
"source ~/dotfiles/nvim/init.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add header directories
set path+=include;includes;include/headers;includes/headers;

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin indent on
set number								" enable line numbers
set relativenumber 						" set relative number
set autoread							" read open files again when changed outside Vim
set autowrite							" write a modified buffer on each :next
set laststatus=0						" disable vim status bar
set mouse=a								" enable mouse support
let mapleader=","						" map leader key to ,
let g:mapleader=","
set encoding=utf-8						" file encoding
set fileencoding=utf-8
set fileencodings=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set softtabstop=0
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Use tabs instead of spaces
set noexpandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD TREE
map <leader>nn :NERDTreeToggle<CR>
" FZF
map <leader>f  :FZF<CR>
" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    ,w     -  write file without confirmation
"    ,q     -  qute  file without confirmation
"    :W     -  save with Sudo
"    Ctrl+S -  save in any mode
"    df		-  <ESC>
"-------------------------------------------------------------------------------
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
imap df <Esc>
command W w !sudo tee % > /dev/null
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

"" Close buffer
noremap <leader>bd :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Split
noremap <Leader>H :<C-u>split<CR>
noremap <Leader>V :<C-u>vsplit<CR>

"" Switching windows
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
noremap <leader>h <C-w>h

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

" 2 spaces down
nnoremap 2o o<CR>

" 2 spaces up
nnoremap 2O O<Esc>O

nnoremap n nzzzv
nnoremap N Nzzzv
"
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set so=7					  	" middle cursor when it's 7 lines before bottom(after top)
set sj=-50						" "
set backspace=indent,eol,start	" fix backspace indent
set ignorecase					" ignore case when searching
set smartcase 					" when searching try to be smart about cases
set lazyredraw 					" don't redraw while executing macros (good performance config)
set incsearch 					" makes search act like search in modern browsers

" No annoying sound on errors
set noerrorbells
set novisualbell

" Open new split panes to right and bottom
set splitright
set splitbelow

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

set background=dark
set termguicolors
colorscheme base16-tomorrow-night
highlight Normal ctermbg=None

" Enable 256 colors support for terminal
set t_Co=256
set guioptions=egmrti

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
autocmd BufLeave,FocusLost * silent! wall
