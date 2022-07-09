" -- F5 compile and run code --
func CompileC()
        exec "w"
        let compilecmd = "!clang "
        let compileflag = ""
        exec compilecmd." % ".compileflag
endfunc
func CompileCpp()
        exec "w"
        let compilecmd = "!clang++ "
        let compileflag = ""
        exec compilecmd." % ".compileflag
endfunc
func CompileRS()
        exec "w"
        let compilecmd = "!cargo "
        let compileflag = "run"
        exec compilecmd.compileflag
endfunc
func CompileRun()
        exec "w"
        if &filetype == "c"
                exec "call CompileC()"
                exec "! ./a.out"
        elseif &filetype == "cpp"
                exec "call CompileCpp()"
                exec "! ./a.out"
        elseif &filetype == "rust"
                exec "call CompileRS()"
                return
        endif
endfunc
map <space>r :call CompileRun() <CR>
