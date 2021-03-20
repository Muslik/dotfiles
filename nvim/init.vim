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

set smarttab
set cindent
set omnifunc=syntaxcomplete#Complete
set number								" enable line numbers
set relativenumber 						" set relative number
set autoread							" read open files again when changed outside Vim
set autowrite							" write a modified buffer on each :next
set laststatus=2						" disable vim status bar
set mouse=a								" enable mouse support
let mapleader=","						" map leader key to Space
let g:mapleader=","
set encoding=utf-8						" file encoding
set fileencoding=utf-8
set fileencodings=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Use tabs instead of spaces
set expandtab

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType tpescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript.tsx setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD TREE
map <leader>n :NERDTreeToggle<CR>
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" FZF
map ; :FZF<CR>
" Tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" COC NVIM
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    ,w     -  write file without confirmation
"    ,q     -  quit  file without confirmation
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

"" Close buffer
noremap <leader>bd :bd<CR>

"" Prev buffer
noremap <leader>bp :bp<CR>

"" Next buffer
noremap <leader>bn :bn<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove<cr>

"" Split
noremap ss :<C-u>split<CR>
noremap sc :<C-u>close<CR>
noremap sv :<C-u>vsplit<CR>

"" Switching windows
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l
noremap sh <C-w>h

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent> <leader>b :Buffers<CR>

" 2 spaces down
nnoremap 2o o<CR>

" 2 spaces up
nnoremap 2O O<Esc>O

nnoremap n nzzzv
nnoremap N Nzzzv

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
set cursorline                  " enabled cursor line

"No annoying sound on errors
set noerrorbells
set novisualbell

" Open new split panes to right and bottom
set splitright
set splitbelow

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
syntax enable

set background=dark
set termguicolors
colorscheme base16-default-dark
let g:lightline = { 'colorscheme': 'base16' }

highlight Error guibg=None
highlight Comment cterm=italic gui=italic
highlight CursorLine guibg=#01121F

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Copy/Paste/Cut in system clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
autocmd BufLeave,FocusLost * silent! wall

augroup project
		autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

let g:SuperTabDefaultCompletionType = "<c-n>"

" Go Vim
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>

augroup END

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 20
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
