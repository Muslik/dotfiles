"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/dotfiles/nvim/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/dotfiles/nvim/my_configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/dotfiles/nvim/temp_dirs/undodir
    set undofile
catch
endtry

map <leader>tt :terminal<cr>
