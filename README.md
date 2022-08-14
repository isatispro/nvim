
<!-- vim-markdown-toc GFM -->

* [主要的目录结构](#主要的目录结构)
* [查看所有的按键映射](#查看所有的按键映射)
* [自动补全](#自动补全)
    * [coc.nvim](#cocnvim)
    * [neovim lsp](#neovim-lsp)
* [markdown](#markdown)
    * [markdown 目录](#markdown-目录)
    * [markdown 表格编辑 tab mode](#markdown-表格编辑-tab-mode)

<!-- vim-markdown-toc -->
# 主要的目录结构
```
├── Ultisnipsa    ---------------------------------------- code snippets config
├── packer    -------------------------------------------- packer directory
├── coc-settings.json    --------------------------------- coc.nvim config
├── init.lua    ------------------------------------------ lua's init entry
├── lua   ------------------------------------------------ lua config directory
│   ├── cfg-dap    --------------------------------------- dap config directory
│   ├── coc    ------------------------------------------- coc.nvim config directory
│   ├── config    ---------------------------------------- plugins config directory
│   ├── keymapping.lua   --------------------------------- main key mapping config
│   ├── lsp    ------------------------------------------- lsp config directory(unused)
│   ├── option.lua    ------------------------------------ vim's option
│   ├── pluginKeys.lua    -------------------------------- part of plugins key mapping
│   ├── plugins.lua   ------------------------------------ plugins list
│   └── utils.lua    ------------------------------------- utils lua scripts(just copy from others)
```

# 查看所有的按键映射

telescope提供了可以查看所有按键映射的功能，使用以下可以看到所有的快捷键映射
```
,m
```
使用频繁的快捷键
| key mapping | function  |
|-------------|-----------|
| ,ff         | find file |

# 自动补全

## coc.nvim
可以使用vscode的插件，现在正在使用的补全插件

## neovim lsp 
nevoim 自带的lsp功能，不成熟，现在没有使用

# markdown

## markdown 目录

| command    | function         |
|------------|------------------|
| GenToc xxx | 生成markdown目录 |
| UpdateToc  | 更新Toc目录      |

## markdown 表格编辑 tab mode
使用`tm`切换tab模式使用状态

