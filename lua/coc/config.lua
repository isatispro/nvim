vim.g.coc_global_extensions = {
 'coc-actions',
 -- 'coc-symbol-line',
 'coc-clang-format-style-options',
 'coc-css',
 'coc-word',
 'coc-tag',
 'coc-lua',
 'coc-pairs',
 -- 'coc-ltex',
 'coc-spell-checker',
 'coc-cmake',
 'coc-diagnostic',
 'coc-explorer',
 'coc-flutter-tools',
 'coc-gitignore',
 'coc-html',
 'coc-json',
 'coc-clangd',
 'coc-lists',
 'coc-marketplace',
 'coc-prettier',
 'coc-pyright',
 'coc-rls',
 'coc-rust-analyzer',
 'coc-snippets',
 'coc-sourcekit',
 'coc-stylelint',
 'coc-syntax',
 'coc-tasks',
 'coc-todolist',
 'coc-translator',
 'coc-tslint-plugin',
 'coc-tsserver',
 'coc-vimlsp',
 'coc-fzf-preview',
 'coc-highlight',
 'coc-vetur',
 'coc-yaml',
 'coc-yank'}

 vim.g.coc_snippet_next = '<tab>'
-- vim.cmd( [[]])
-- vim.fn.source("config.vim")
-- vim scripts load
vim.cmd('source ~/.config/nvim/lua/coc/config.vim')
-- vim.cmd('source ~/.config/nvim/lua/coc/ccls.vim')
-- Some servers have issues with backup files, see #649.

