-- https://github.com/kyazdani42/nvim-tree.lua
-- require'nvim-tree'.setup {
--     -- 不显示 git 状态图标
--     git = {
--         enable = false
--     }
-- }-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
