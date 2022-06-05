-- leader key 为空格
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}
-- 
map("n", "<C-k>", "4k", opt)
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true , silent = false})
map("v", "/", "/\\v", { noremap = true , silent = false})

map('n', '<leader>w', ':w<CR>', opt)
map('n', '<leader>q', ':q<CR>', opt)
------------------------------------------------------------------
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- 关闭当l
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- 比例控制 map("n", "s.", ":vertical resize +20<CR>", opt)
map("n", "sh", ":vertical resize +10<CR>", opt)
map("n", "sl", ":vertical resize -10<CR>", opt)
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)

--------------------------------------------------------------------
-- 插件快捷键
-- nvimTree
map('n', '<leader>nn', ':NvimTreeToggle<CR>', opt)

-- symbols-outline
map('n', '<leader>tl', ':SymbolsOutline<CR>', opt)

-- bufferline 左右Tab切换
map("n", "]b", ":BufferLineCyclePrev<CR>", opt)
map("n", "[b", ":BufferLineCycleNext<CR>", opt)

-- no highlight
map("n", "<leader>/", ":nohl<cr>", opt)

-- translate 代码格式化
map("n", "<leader>ts", ":Translate<cr>", opt)
map("v", "<leader>ts", ":TranslateV<cr>", opt)

-- no highlight
map("n", "<leader>/", ":nohl<cr>", opt)
-- map("n", "<leader>i", "gg=G", opt)

-- calltree
map("n", "<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opt)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<leader>fa", ":Telescope tags<CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<leader>m", ":Telescope keymaps<CR>", opt)

-- -- ToggleTerm
-- function _G.set_terminal_keymaps()
--   map("t", "<esc>", "<C-\\><C-n>")
--   map("t", "<A-h>", "<c-\\><c-n><c-w>h")
--   map("t", "<A-j>", "<c-\\><c-n><c-w>j")
--   map("t", "<A-k>", "<c-\\><c-n><c-w>k")
--   map("t", "<A-l>", "<c-\\><c-n><c-w>l")
--
--   map("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
--   map("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
--   map("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
--   map("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
-- end
--
-- vim.api.nvim_create_autocmd("TermOpen", {
--   pattern = "term://*",
--   callback = function()
--     set_terminal_keymaps()
--   end,
-- })

require('pluginKeys')
