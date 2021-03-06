""""""""""""""""""""""""""""""""""""
" => Plug start
""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/autoload')

""""""""""""""""""""""""""""""""""""
" => nerd Tree
Plug 'preservim/nerdtree'

" quick edit
" 快速注释
Plug 'scrooloose/nerdcommenter'

" auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': 'v0.0.79'}
Plug 'wellle/tmux-complete.vim'
Plug 'antoinemadec/coc-fzf'

"""""""""""""""""""""""""""""""""""
" => 输入法
" Plug 'https://github.com/vim-scripts/fcitx.vim.git'

"""""""""""""""""""""""""""""""""""
" => theme 颜色主题 
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'

"""""""""""""""""""""""""""""""""""
" => 状态栏 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"""""""""""""""""""""""""""""""""""
" => buffer 切换
" Plug 'cdchawthorne/nvim-tbufferline'
" Plug 'bling/vim-bufferline'
" Plug 'jlanzarotta/bufexplorer'
" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#bufferline#overwrite_variables = 1

"""""""""""""""""""""""""""""""""""
" => 符号对齐
Plug 'junegunn/vim-easy-align'

"""""""""""""""""""""""""""""""""""
" => 自动生成索引
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"""""""""""""""""""""""""""""""""""
" => 符号对齐
Plug 'vim-scripts/taglist.vim'
Plug 'liuchengxu/vista.vim'
"Plug 'preservim/tagbar'
"nmap <leader>tl :TagbarToggle<cr> 

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" ===
" === rnvimr
" ===
Plug 'kevinhwang91/rnvimr'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"""""""""""""""""" vim instant config end   """"""""""""""""""""""""""

"""""""""""""""""" vim tag highlight start """""""""""""""""""""""""""
Plug 'vim-scripts/TagHighlight'
"""""""""""""""""" vim tag highlight end   """""""""""""""""""""""""""

Plug 'glepnir/dashboard-nvim'

call plug#end()
"""""""""""""""""""""""""""""""""""
" => Plug end 
"""""""""""""""""""""""""""""""""""
