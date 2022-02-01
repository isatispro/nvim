""""""""""""""""""""""""""""""""""""
" => Plug Config start
""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.config/nvim/plugList.vim")) " neovim
  source ~/.config/nvim/plugList.vim
endif

""""""""""""""""""""""""""""""""""""
" ==> nerd Tree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=25

""""""""""""""""""""""""""""""""""""
" ==> simpyfold
" set foldmethod = indent

" ===
" === AutoFormat
" ===

augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	autocmd FileType rust AutoFormatBuffer rustfmt
	autocmd FileType vue AutoFormatBuffer prettier
augroup END

""""""""""""""""""""""""""""""""""""
" ==> quick edit
" 快速注释
let g:NERDSpaceDelims=1
let g:NERDAltDelims_python = 1

if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" Default:
" If a delimiter is in a highlight group whose name matches any of the followings, it will be ignored.
let g:easy_align_ignore_groups = ['Comment', 'String']

" add_list_source(name, description, command)
" call coc_fzf#common#add_list_source('fzf-buffers', 'display open buffers', 'Buffers')

""""""""""""""""""""""""""""""""""""
" ==> auto Complete

" delete_list_source(name)
" call coc_fzf#common#delete_list_source('fzf-buffers')
" allow to scroll in the preview
set mouse=a

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-actions',
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-clangd',
	\ 'coc-lists',
	\ 'coc-marketplace',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-rls',
	\ 'coc-rust-analyzer',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-todolist',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vimlsp',
    \ 'coc-fzf-preview', 
    \ 'coc-highlight',
	\ 'coc-vetur',
	\ 'coc-yaml',
	\ 'coc-yank']

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

let g:snips_author = 'isatis'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" Use <C-l> for trigger snippet expand.
imap <C-s> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
" 
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
" 
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

"""""""""""""""""""""""""""""""""""
" => theme 颜色主题 
autocmd vimenter * ++nested colorscheme gruvbox
syntax enable
set background=dark
"colorscheme molokai
let g:solarized_termcolors=256
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"""""""""""""""""""""""""""""""""""
" => 状态栏 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
" let g:airline_disable_statusline = 1

let g:airline_theme='dark'
" let g:airline_theme_patch_func = 'AirlineThemePatch'
" function! AirlineThemePatch(palette)
"   if g:airline_theme == 'molokai'
"     for colors in values(a:palette.inactive)
"       let colors[3] = 245
"     endfor
"   endif
" endfunction

" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1
" }}}

" rainbow_parentheses {{{
"    " 不加入这行, 防止黑色括号出现, 很难识别
"    " \ ['black',       'SeaGreen3'],
"    let g:rbpt_colorpairs = [
"        \ ['brown',       'RoyalBlue3'],
"        \ ['Darkblue',    'SeaGreen3'],
"        \ ['darkgray',    'DarkOrchid3'],
"        \ ['darkgreen',   'firebrick3'],
"        \ ['darkcyan',    'RoyalBlue3'],
"        \ ['darkred',     'SeaGreen3'],
"        \ ['darkmagenta', 'DarkOrchid3'],
"        \ ['brown',       'firebrick3'],
"        \ ['gray',        'RoyalBlue3'],
"        \ ['darkmagenta', 'DarkOrchid3'],
"        \ ['Darkblue',    'firebrick3'],
"        \ ['darkgreen',   'RoyalBlue3'],
"        \ ['darkcyan',    'SeaGreen3'],
"        \ ['darkred',     'DarkOrchid3'],
"        \ ['red',         'firebrick3'],
"        \ ]
"
"    let g:rbpt_max = 16
"    let g:rbpt_loadcmd_toggle = 0
"    au VimEnter * RainbowParenthesesToggle
"    au Syntax * RainbowParenthesesLoadRound
"    au Syntax * RainbowParenthesesLoadSquare
"    au Syntax * RainbowParenthesesLoadBraces
" }}}

"""""""""""""""""""""""""""""""""""
" => 自动生成索引
""""""""""""""""""""""""""" gutentags settings """"""""""""""""""""""""""""""
" The path to store tags files, instead of in the project root.
" let g:gutentags_project_root = ['.root']
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" let g:gutentags_cache_dir = stdpath('cache') . '/ctags'
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_exclude = ['*.md', '*.html', '*.json', '*.toml', '*.css', '*.js',]
" let g:gutentags_plus_switch = 1
" let g:gutentags_define_advanced_commands = 1

" enable gtags module
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" 
" " config project root markers.
" let g:gutentags_project_root = ['.root']
" 
" " generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" 
" " change focus to quickfix window after search (optional).
" let g:gutentags_plus_switch = 1
" 
" let g:gutentags_define_advanced_commands = 1
" 
" if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
" 	finish
" endif

""""""""""""""""""""""""""" vista settings """"""""""""""""""""""""""""""""""
" let g:vista#renderer#icons = {
"       \ 'member': '',
"       \ }
" 
" " Do not echo message on command line
" let g:vista_echo_cursor = 0
" " Stay in current window when vista window is opened
" let g:vista_stay_on_open = 0
" 
" augroup vista_conf
"   autocmd!
"   " Double mouse click to go to a tag
"   autocmd FileType vista* nnoremap <buffer> <silent>
"         \ <2-LeftMouse> :<C-U>call vista#cursor#FoldOrJump()<CR>
" augroup END
" 
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

nnoremap <silent> <Space>t :<C-U>Vista!!<CR>
"nnoremap <silent> <leader>tl :<C-U>Vista!!<CR>
" "}}

noremap <leader>v :Vista coc<CR>
noremap <c-t> :silent! Vista finder coc<CR>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_sidebar_position = 'vertical topleft'

"""""""""""""""""""""""""""""""""""
" => 符号对齐
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0         "在右侧窗口中显示taglist窗口
let Tlistupdate = 0         "在右侧窗口中显示taglist窗口
" let g:tagbar_left = 1

" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
" set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
" set rtp+=/home/isatis/.linuxbrew/opt/fzf

" let g:fzf_command_prefix = 'Fzf'
" let g:fzf_preview_window = 'right:60%'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

let g:fzf_commits_log_options = '--graph --color=always --format="%c(auto)%h%d %s %c(black)%c(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b3", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
if filereadable("GTAGS")
    "cs add GTAGS
    "let g:Lf_GtagsSource = "./GTAGS"
endif

let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules', '.svn'],
        \ 'file': ['__vim_project_root']
        \}
let g:Lf_UseMemoryCache = 1
let g:Lf_UseCache = 1

""""""""""""""""""""""""""""""""""""
" ==> dashboard
let g:dashboard_default_executive ='fzf'

" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" ===
" === MarkdownPreview
" ===


""""""""""""""""""""""""""""""""""""
" => Plug Config end
""""""""""""""""""""""""""""""""""""
