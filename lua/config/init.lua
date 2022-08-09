require('config.notify')
require('config.bufferline_cfg')
require('config.nvim-tree')
require('config.comment')

-- require('config.nvim-treesitter')
-- require('config.treesitter-context')
require('config.telescope')
-- Enable telescope fzf native
-- require('telescope').load_extension 'fzf'

-- require('config.nvim-autopairs')
require('config.comment')
-- require('config.whichkey')
-- require('config.litee-family')
-- require('config.aerial')
require('config.symbols-outline')
require('config.fidget')
require('config.alpha')
require('config.terminal')
require('config.fzf')
require('config.cscope')
-- require('config.fcitx5_cfg')
-- require('config.auto_session_cfg')
require('config.lualine_cfg')
require('config.project')
require('config.neoformat')
-- require('config.bqf')
require('config.competitest')
--require('config.code_runner')
require('config.cfg_gdb')
require('config.vscode')
require('config.cfg_neoscroll')
require('config.cfg_suda')

--vim cfg
vim.cmd('source ~/.config/nvim/lua/config/vista_cfg.vim')
vim.cmd('source ~/.config/nvim/lua/config/code_run.vim')
vim.cmd('source ~/.config/nvim/lua/config/file_header.vim')
