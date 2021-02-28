""""""""""""""""""""""""""""""""""""
" => Plug Config start
""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.config/nvim/myplug.vim")) " neovim
  source ~/.config/nvim/myplug.vim
endif

""""""""""""""""""""""""""""""""""""
" ==> nerd Tree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35


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
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-python',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-clangd',
	\ 'coc-spell-checker',
	\ 'coc-terminal',
	\ 'coc-browser',
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

"""""""""""""""""""""""""""""""""""
" => theme 颜色主题 
autocmd vimenter * ++nested colorscheme gruvbox
syntax enable
set background=dark
"colorscheme molokai
let g:solarized_termcolors=256

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
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_define_advanced_commands = 1


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
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
set rtp+=/home/david/.linuxbrew/opt/fzf

let g:fzf_preview_window = 'right:60%'
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
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
" let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'

let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0

"""""""""""""""""" vim instant config start """"""""""""""""""""""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 1

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = 'firefox'

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
" let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

""""""""""""""""""""""""""""""""""""
" ==> dashboard
let g:dashboard_default_executive ='fzf'

""""""""""""""""""""""""""""""""""""
" => Plug Config end
""""""""""""""""""""""""""""""""""""
