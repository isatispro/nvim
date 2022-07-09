"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"添加新文件类型支持
" au BufNewFile,BufRead *.vue      setf vue
"新建.c,.h,.sh,.java文件，自动插入文件头
" autocmd BufNewFile *.go,*.cc,*.cpp,*.[ch],*.sh,*.java,*.vue, exec ":call SetTitle()"

" 检测文件类型
filetype on  

" 针对不同的文件类型采用不同的缩进格式
filetype indent on

" 允许插件
filetype plugin on

" 启动自动补全
filetype plugin indent on

" autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

autocmd BufNewFile *.go,*.cc,*.cpp,*.[ch],*.sh,*.java,*.py, exec ":call SetTitle()"

if !exists('g:file_copyright_name')
  let g:file_copyright_name = "isatis"
endif
if !exists('g:file_copyright_email')
  let g:file_copyright_email = "704739397@qq.com"
endif

func SetTitle_cpp()
    let header=
            \[
            \"/*\#########################################################################",
            \"\# Copyright (C) 2022 All rights reserved.",
            \"\#",
            \"\# Author        : ".expand(g:file_copyright_name),
            \"\# Email         : ".expand(g:file_copyright_email),
            \"\# File Name     : ".expand("%"),
            \"\# Created Time  : ".strftime("%c"),
            \"\# Describe      : ",
            \"\#",
            \"\#########################################################################*/",
            \"",
            \"\#include<bits/stdc++.h>",
            \"",
            \"using namespace std;",
            \"",
            \"int main(int argc,char * argv[]) {",
            \"",
            \"    return 0;",
            \"}",
            \]
    let i = 0
    while i < len(header)
        call append(i, header[i])
        let i += 1
    endwhile
endfunc

func SetTitle_c()
    let header=
            \[
            \"/*\#########################################################################",
            \"\# Copyright (C) 2022 All rights reserved.",
            \"\#",
            \"\# Author        : ".expand(g:file_copyright_name),
            \"\# Email         : ".expand(g:file_copyright_email),
            \"\# File Name     : ".expand("%"),
            \"\# Created Time  : ".strftime("%c"),
            \"\# Describe      : ",
            \"\#",
            \"\#########################################################################*/",
            \"",
            \"\#include <stdlib.h>",
            \"\#include <stdio.h>",
            \"\#include <string.h>",
            \"",
            \"int main(int argc,char * argv[]) {",
            \"",
            \"    return 0;",
            \"}",
            \]
    let i = 0
    while i < len(header)
        call append(i, header[i])
        let i += 1
    endwhile
endfunc

func SetTitle_go()
    let header=
            \[
            \"\/*#########################################################################",
            \"\# Copyright (C) 2022 All rights reserved.",
            \"\#",
            \"\# Author        : ".expand(g:file_copyright_name),
            \"\# Email         : ".expand(g:file_copyright_email),
            \"\# File Name     : ".expand("%"),
            \"\# Created Time  : ".strftime("%c"),
            \"\# Describe      : ",
            \"\#",
            \"\#########################################################################*/",
            \"",
            \"package main",
            \"import (\"fmt\")",
            \"func main() {",
            \"}",
            \]
    let i = 0
    while i < len(header)
        call append(i, header[i])
        let i += 1
    endwhile
endfunc

func SetTitle_sh()
    let header=
            \[
            \"\#########################################################################",
            \"\# Copyright (C) 2022 All rights reserved.",
            \"\#",
            \"\# Author        : ".expand(g:file_copyright_name),
            \"\# Email         : ".expand(g:file_copyright_email),
            \"\# File Name     : ".expand("%"),
            \"\# Created Time  : ".strftime("%c"),
            \"\# Describe      : ",
            \"\#",
            \"\#########################################################################",
            \"",
            \]
    let i = 0
    while i < len(header)
        call append(i, header[i])
        let i += 1
    endwhile
endfunc

func SetTitle_py()
    let header=
            \[
            \"\#########################################################################",
            \"\# Copyright (C) 2022 All rights reserved.",
            \"\#",
            \"\# Author        : ".expand(g:file_copyright_name),
            \"\# Email         : ".expand(g:file_copyright_email),
            \"\# File Name     : ".expand("%"),
            \"\# Created Time  : ".strftime("%c"),
            \"\# Describe      : ",
            \"\#",
            \"\#########################################################################",
            \"",
            \"if __name__ == '__main__':",
            \"   print(\"aa\")",
            \]
    let i = 0
    while i < len(header)
        call append(i, header[i])
        let i += 1
    endwhile
endfunc

""定义函数SetTitle，自动插入文件头
func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call SetTitle_sh()  
  endif

  if &filetype == 'cpp'
      call SetTitle_cpp()
  endif

  if &filetype == 'c'
      call SetTitle_c()
  endif

  if &filetype == 'go'
      call SetTitle_go()
  endif

  if &filetype == 'py'
      call SetTitle_py()
  endif

endfunc

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

