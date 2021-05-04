
let mapleader=","
let g:mapleader = ','

"""""""""""""""""""""""""""""""""""
" => config start
""""""""""""""""""""""""""""""""""

let g:python3_host_prog = "python3"

nmap <leader>w :w!<cr>

" history存储容量
set history=2000

" 检测文件类型
filetype on  

" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" 允许插件
filetype plugin on

" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread

" 显示行号
set nu

" 取消换行
" set nowrap

" 突出显示当前列
" set cursorcolumn

" 突出显示当前行
set cursorline

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
" set t_ti= t_te=

" 鼠标暂不启用, 键盘党....
" set mouse-=a
" 启用鼠标
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide

" For regular expressions turn magic on
set magic

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

set encoding=utf8

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

set shiftwidth=4

set cindent
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" 设置新文件的编码为 UTF-8
set encoding=utf-8

" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  

" Use Unix as the standard file type
set ffs=unix,dos,mac

set helplang=cn 

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
" colorscheme peaksea

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map <leader>/ :nohls<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" SPACE 映射buffer切换
" noremap <SPACE>bp :bp<CR>
" noremap <SPACE>bn :bn<CR>

" tab切换
" map <leader>th :tabfirst<cr>
" map <leader>tl :tablast<cr>
" 
" map <leader>tj :tabnext<cr>
" map <leader>tk :tabprev<cr>
" map <leader>tn :tabnext<cr>
" map <leader>tp :tabprev<cr>
" 
" map <leader>te :tabedit<cr>
" map <leader>td :tabclose<cr>
" map <leader>tm :tabm<cr>
" 
" " normal模式下切换到确切的tab
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
" noremap <leader>6 6gt
" noremap <leader>7 7gt
" noremap <leader>8 8gt
" noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>
" Toggles between the active and last active tab "
" The first tab is always 1 "

" let g:last_active_tab = 1
" " nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" " nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" " vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
" autocmd TabLeave * let g:last_active_tab = tabpagenr()
" 
" " 新建tab  Ctrl+t
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-t>     <Esc>:tabnew<CR>

" select all
map <Leader>sa ggVG

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
" nnoremap <leader>w :w<CR>

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        " call setline(1, "\#!/usr/bin/env python")
        " call append(1, "\# encoding: utf-8")
        call setline(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sd :set splitbelow<CR>:split<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sr :set splitright<CR>:vsplit<CR>

" 使用ctrl + 方向健调整当前窗口大小 
noremap <C-up> :res +5<CR>
noremap <C-down> :res -5<CR>
noremap <C-left> :vertical resize-5<CR>
noremap <C-right> :vertical resize+5<CR>

" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen
" au FileType javascript setl nocindent
" 
" au FileType javascript imap <C-t> $log();<esc>hi
" au FileType javascript imap <C-a> alert();<esc>hi
" 
" au FileType javascript inoremap <buffer> $r return 
" au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi
" 
" function! JavaScriptFold() 
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
" 
"     function! FoldText()
"         return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
" endfunction

""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif

""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html

""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""
" => c/c++
""""""""""""""""""""""""""""""
autocmd BufNeWFile *.[ch],*.cpp exec ":call CFileHeader()"
func CFileHeader()
        call setline(1, "// File:    ".strftime(expand('%d')))
        call append(line("."), "// Author:  xianhui (definezxh@163.com)")
        call append(line(".")+1, "// Date:    " .strftime("%Y/%m/%d %H:%M:%S"))
        call append(line(".")+2, "")
        exec "$"
endfunc

autocmd BufEnter *.[ch],*.cpp exec ":call CFileIndent()"
func CFileIndent()
        set cindent
        set tabstop=4
        set softtabstop=4
        set expandtab
        set shiftwidth=4
endfunc

func CodeFormat()
        exec "w"
        if &filetype == "h"
                exec "!astyle -n --style=kr -s4 %"
        elseif &filetype == "c"
                exec "!astyle -n --style=kr -s4 %"
        elseif &filetype == "cpp"
                exec "!astyle -n --style=google %"
        endif
endfunc

map <C-F> :call CodeFormat() <CR>
" -- F5 compile and run code --
func CompileC()
        exec "w"
        let compilecmd = "!clang "
        if search("math\.h") != 0
                let compileflag .= "-lm"
        endif
        exec compilecmd." % ".compileflag
endfunc
func CompileCpp()
        exec "w"
        let compilecmd = "!clang++ "
        let compileflag = ""
        exec compilecmd." % ".compileflag
endfunc
func CompileRun()
        exec "w"
        if &filetype == "c"
                exec "call CompileC()"
        elseif &filetype == "cpp"
                exec "call CompileCpp()"
        endif
        exec "! ./a.out"
endfunc
map<F5> <ESC> :call CompileRun() <CR>

"######auto fcitx  ###########
" let g:input_toggle = 1
" function! Fcitx2en()
"     let s:input_status = system("fcitx5-remote")
"     if s:input_status == 2
"         let g:input_toggle = 1
"         let l:a = system("fcitx-remote5 -c")
"     endif
" endfunction
" 
" function! Fcitx2zh()
"     let s:input_status = system("fcitx5-remote")
"     if s:input_status != 2 && g:input_toggle == 1
"         let l:a = system("fcitx-remote -o")
"         let g:input_toggle = 0
"     endif
" endfunction

if has("cscope")
    set csprg=/usr/bin/cscope   " 制定cscope命令
    set csto=0                  " ctags查找顺序，0表示先cscope数据库再标签文件，1表示先标签文件爱
    set cst                     " 同时搜索tag文件和cscope数据库
    set cscopequickfix=s-,c-,d-,i-,t-,e-  "使用QucikFix窗口来显示cscope查找结果
    set nocsverb
    if filereadable("cscope.out")  "如果当前目录下有cscope.out则加载进Vim
        cs add cscope.out
    elseif $CSCOPE_DB != ""       "否则只要环境变量不为空就添加制定的数据库到Vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif

"map <F4>:!cscope -Rbq<CR>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
" 查找符号
nmap <SPACE>cs :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" 查找定义
nmap <SPACE>cg :cs find g <C-R>=expand("<cword>")<CR><CR> 
" 查找被这个函数调用的函数
nmap <SPACE>cd :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
" 查找调用这个函数的函数
nmap <SPACE>cc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个字符串
nmap <SPACE>ct :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个egrep匹配模式
nmap <SPACE>ce :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
" 查找这个文件
nmap <SPACE>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 查找include这个文件的文件
nmap <SPACE>ci :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

" 设定是否使用QuickFix来显示结果
set cscopequickfix=s-,c-,d-,i-,t-,e-
 
" " QuickFix open and close
" nnoremap <F11> :copen<CR>
" nnoremap <F12> :cclose<CR>
" 
" " QucikFix next and prev
" nnoremap <leader>cn :cn<CR>
" nnoremap <leader>cp :cp<CR>
" 
"  "--------------------------------------------------------------------------------
" "  自动加载ctags: ctags -R
" if filereadable("tags")
"       set tags=tags
" endif
" 
" 
" "  自动保存 kernel 的ctags文件
" if isdirectory("kernel/") && isdirectory("mm/")
" 	au BufWritePost *.c,*.h silent! !ctags -L tags.files&
" 	au BufWritePost *.c,*.h silent! !cscope -bkq -i tags.files&
" endif
" 
" 
" "--------------------------------------------------------------------------------
" " global:建立数据库
" "--------------------------------------------------------------------------------
" if filereadable("GTAGS")
" 	set cscopetag
" 	set cscopeprg=gtags-cscope
" 	cs add GTAGS
" 	au BufWritePost *.c,*.cpp,*.h silent! !global -u &
" endif
" 
" MiniBufExp :  Ctrl + Tab 键可以在minibuf中选择，Ctrl+h,j,k,l或者方向键
" 来选择窗口
 "--------------------------------------------------------------------------------
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

set ttimeoutlen=150
"退出插入模式
" autocmd InsertLeave * call Fcitx2en()
"进入插入模式
" autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"添加新文件类型支持
au BufNewFile,BufRead *.vue      setf vue
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.go,*.cc,*.cpp,*.[ch],*.sh,*.java,*.vue, exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1,"\#########################################################################")
    call append(line("."), "\# File Name: ".expand("%"))
    call append(line(".")+1, "\# Author: JayGuan")
    call append(line(".")+2, "\# Mail:")
    call append(line(".")+3, "\# Created Time: ".strftime("%c"))
    call append(line(".")+4, "\#########################################################################")
    call append(line(".")+5, "\#!/bin/bash")
    call append(line(".")+6, "")
  else
    call setline(1,"\/*#########################################################################")
    call append(line("."), "\# File Name: ".expand("%"))
    call append(line(".")+1, "\# Author: JayGuan")
    call append(line(".")+2, "\# mail:")
    call append(line(".")+3, "\# Created Time: ".strftime("%c"))
    call append(line(".")+4, "\#########################################################################*/")
    call append(line(".")+5, "")
  endif
  if &filetype == 'cpp'
    call append(line(".")+6, "#include<iostream>")
    call append(line(".")+7, "using namespace std;")
    call append(line(".")+8, "int main(int argc,char * argv[]) {")
    call append(line(".")+9, "return 0;")
    call append(line(".")+10, "}")
    call append(line(".")+11, "")
  endif
  if &filetype == 'c'
    call append(line(".")+6, "#include<stdio.h>")
    call append(line(".")+7, "int main(int argc,char * argv[]) {")
    call append(line(".")+8, "return 0;")
    call append(line(".")+9, "}")
    call append(line(".")+10, "")
    call append(line(".")+11, "")
  endif
  if &filetype == 'go'
    call append(line(".")+6, "package main")
    call append(line(".")+7, "import (\"fmt\")")
    call append(line(".")+8, "func main() {")
    call append(line(".")+9, "}")
    call append(line(".")+10, "")
    call append(line(".")+11, "")
  endif
  if &filetype == 'vue'
    call setline(1,"\<!-- ######################################################################### -->")
    call setline(2,"\<!-- #Filename: ".expand("%")." -->")
    call setline(3,"\<!-- #Author: JayGuan -->")
    call setline(4,"\<!-- #Mail: -->")
    call setline(5,"\<!-- #Createrd Time: ".strftime("%c")." -->")
    call setline(6,"\<!-- ######################################################################### -->")

    call append(line(".")+6, "<template>")
    call append(line(".")+7, "<!-- Here Set Template -->")
    call append(line(".")+8, "  <div id=\"app\">")
    call append(line(".")+9, "  </div>")
    call append(line(".")+10, "</template>")
    call append(line(".")+11, "<script>")
    call append(line(".")+12, "// Here Set javascript")
    call append(line(".")+13, "export default {")
    call append(line(".")+14, " name: ".expand("%"))
    call append(line(".")+15, " data () {")
    call append(line(".")+16, "   return {")
    call append(line(".")+17, "   }")
    call append(line(".")+18, " }")
    call append(line(".")+19, "}")
    call append(line(".")+20, "</script>")
    call append(line(".")+21, "<style>")
    call append(line(".")+22, "/* Here Set Style */")
    call append(line(".")+23, "</style>")
  endif
  endfunc
  "新建文件后，自动定位到文件末尾
  autocmd BufNewFile * normal G

  """"显示当前行所在的函数名字“”“

  fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
  endfun
  map f :call ShowFuncName() <CR>
