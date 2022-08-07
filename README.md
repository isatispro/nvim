# 主要的目录结构
```
├── Ultisnips    ----------------------------------------- code snippets config
├── coc-settings.json    --------------------------------- coc.nvim config
├── init.lua    ------------------------------------------ lua's init entry
├── lua   ------------------------------------------------ lua config directory
│   ├── cfg-dap    --------------------------------------- dap config directory
│   ├── coc    ------------------------------------------- coc.nvim config directory
│   ├── config    ---------------------------------------- plugins config directory
│   ├── keymapping.lua   --------------------------------- main keymapping config
│   ├── lsp    ------------------------------------------- lsp config directory(unuse)
│   ├── option.lua    ------------------------------------ vim's option
│   ├── pluginKeys.lua    -------------------------------- part of plugins's keymapping
│   ├── plugins.lua   ------------------------------------ plugins list
│   └── utils.lua    ------------------------------------- utils lua scripts(just copy from others)
```

# 查看所有的按键映射

telescope提供了可以查看所有按键映射的功能，使用以下可以看到所有的快捷键映射
```
,m
```


