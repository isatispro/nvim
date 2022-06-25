-- leader key 为空格
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

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
-- map('n', '<leader>tl', ':SymbolsOutline<CR>', opt)

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

-- fuzzy find(fzf Telescope)
map("n", "<leader>ff", ":FzfLua files<CR>", opt)
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>fg", ":FzfLua live_grep<CR>", opt)
map("n", "<leader>b", ":FzfLua buffers<CR>", opt)
map("n", "<leader>fa", ":FzfLua tags<CR>", opt)
map("n", "<leader>fb", ":FzfLua btags<CR>", opt)
map("n", "<leader>fh", ":FzfLua help_tags<CR>", opt)
map("n", "<leader>m", ":Telescope keymaps<CR>", opt)
map("n", "<leader>ta", ":FzfLua lsp_workspace_symbols<CR>", opt)
map("n", "<leader>tb", ":FzfLua lsp_document_symbols<CR>", opt)

-- cscope

-- lsp
-- map("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
-- map("n", "<leader>t", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
-- map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
-- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
-- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
-- map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
-- map("n", "<leader>u", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
-- map("n", "<A-cr>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
-- map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
-- map("n", "<leader>dj", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opt)
-- map("n", "<leader>dk", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opt)
-- map("n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
-- map("n", "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt)
-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- coc
map("n", "ts", "<Plug>(coc-translator-p)", opt)
map("n", "cm", ":CocList marketplace<cr>", opt)
map("n", "ca", ":CocList symbols<cr>", opt)
map("n", "cf", ":CocList files<cr>", opt)
map("n", "cg", ":CocList grep<cr>", opt)
map("n", "cl", ":CocList lines<cr>", opt)
map("n", "ct", ":CocList tags<cr>", opt)
map('n', '<leader>tl', ':CocList outline<CR>', opt)

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
