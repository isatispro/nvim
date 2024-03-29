local fn = vim.fn
local install_path = fn.stdpath("config") .. "/packer/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	compile_path = fn.stdpath("cache") .. "/plugins/packer_compiled.lua",
	display = {
		-- open_fn = function()
		--   return require("packer.util").float { border = "rounded" }
		-- end,
	},
})

return require("packer").startup(function()
	use("lewis6991/impatient.nvim") -- Speed up loading Lua modules    TODO: figure out how to use this
	-- Packer can manage itself
	use({
		"wbthomason/packer.nvim",
	})

	use("rcarriga/nvim-notify") -- notify
	use("kyazdani42/nvim-web-devicons") -- icons

	-- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		tag = "compat-nvim-0.7",
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
	}) -- enhance texetobject selection
	use("romgrk/nvim-treesitter-context") -- show class/function at the top
	-- use "m-demare/hlargs.nvim"
	-- use "smiteshp/nvim-gps" -- statusline shows class structure
	use("andymass/vim-matchup")

	-- bufferline
	use("akinsho/bufferline.nvim") -- buffer
	use("kazhala/close-buffers.nvim") -- 实现删除不可见 buffer 的功能

	-- Comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	-- nvim-autopairs
	use("windwp/nvim-autopairs")
	--------------------------- colorscheme ------------------------------------
	-- gruvbox
	use({
		"ellisonleao/gruvbox.nvim",
		requires = { "rktjmp/lush.nvim" },
		-- config = 'vim.cmd([[colorscheme gruvbox]])'
	})
	use("askfiy/visual_studio_code")
	-- zephyr
	use("glepnir/zephyr-nvim")
	-- nord
	use("shaunsingh/nord.nvim")
	-- onedark
	use("ful1e5/onedark.nvim")

	-- Debugger
	use("ravenxrz/DAPInstall.nvim") -- help us install several debuggers
	-- use "Pocco81/dap-buddy.nvim" -- help us install several debuggers
	use("ravenxrz/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	-- use "mfussenegger/nvim-dap-python"    -- debug python
	-- use { "leoluz/nvim-dap-go", module = "dap-go" } -- debug golang
	use({ "jbyuki/one-small-step-for-vimkind", module = "osv" }) -- debug any Lua code running in a Neovim instance
	use({
		"sakhnik/nvim-gdb",
		run = "./install.sh",
	})

	use("norcalli/nvim-colorizer.lua") -- show color
	use("folke/trouble.nvim")
	use({ "j-hui/fidget.nvim", tag = "legacy" }) -- show lsp progress
	use("voldikss/vim-translator") -- show lsp progress

	-- c/c++
	use("jackguo380/vim-lsp-cxx-highlight") -- 为 c/cpp 提供基于 lsp 的高亮
	use("skywind3000/vim-cppman") -- http://cplusplus.com/ 和 http://cppreference.com/ 获取文档
	-- use {
	--   "simrat39/symbols-outline.nvim",
	-- }

	use("liuchengxu/vista.vim") --vim symbols line

	use("mg979/vim-visual-multi") -- 同时编辑多个位置

	use({ "akinsho/toggleterm.nvim" })

	-------------------------- coc -------------------------------------------
	-- Use release branch (recommend)

	-- use {
	-- -- Or build from source code by using yarn: https://yarnpkg.com
	-- 'neoclide/coc.nvim',
	-- branch = 'master',
	-- use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
	-- -- use {'neoclide/coc.nvim', branch = 'release'}
	-- use {
	--     'honza/vim-snippets'
	-- }

	-- use {
	--   'stevearc/aerial.nvim',
	--   config = function() require('aerial').setup() end
	-- }
	-------------------------- lsp -------------------------------------------

	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" }) --})
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "jay-babu/mason-null-ls.nvim" })
	use({ "RRethy/vim-illuminate" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- lspconfig
	-- use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
	-- use "kosayoda/nvim-lightbulb" -- code action
	-- use "ray-x/lsp_signature.nvim"
	--
	-- -- nvim-cmp
	-- use 'ms-jpq/coq_nvim' -- { name = nvim_lsp }
	-- use 'ms-jpq/coq.artifacts' -- { name = nvim_lsp }
	-- use 'ms-jpq/coq.thirdparty' -- { name = nvim_lsp }
	--
	-- use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
	-- use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
	-- use 'hrsh7th/cmp-path'     -- { name = 'path' }
	-- use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
	-- use "tamago324/nlsp-settings.nvim"
	--
	-- use "jsfaint/gen_tags.vim"
	-- use "ray-x/cmp-treesitter"
	-- use "f3fora/cmp-spell" -- spell check
	-- use 'hrsh7th/nvim-cmp'
	-- -- vsnip
	-- use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
	-- use 'hrsh7th/vim-vsnip'
	-- use 'rafamadriz/friendly-snippets'
	-- use "hrsh7th/cmp-nvim-lua"
	-- -- lspkind
	-- use 'onsails/lspkind-nvim'
	-- use 'github/copilot.vim'

	use("dhananjaylatkar/cscope_maps.nvim")
	use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })

	use("simrat39/rust-tools.nvim")
	use("rust-lang/rust.vim")

	--lua
	-- use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	-- use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- fzf-lua
	use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } })
	--------------------- telescope -----------------------------
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope-rg.nvim")
	use("MattesGroeger/vim-bookmarks")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("ahmedkhalf/project.nvim")

	-- packer
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	-- use 'hosxy/fcitx5.nvim'

	-- use 'rmagatti/auto-session' -- 打开 vim 的时候，自动回复上一次打开的样子
	use("mbbill/undotree") -- 显示编辑的历史记录

	-- use 'vim-airline/vim-airline' -- 状态栏
	-- use 'vim-airline/vim-airline-themes' -- 状态栏的主题

	use({ "nvim-lualine/lualine.nvim", tag = "compat-nvim-0.6" }) --底部状态栏

	use("goolord/alpha-nvim")
	use("sbdchd/neoformat")

	use("lambdalisue/suda.vim")
	--  use {
	-- 'xeluxee/competitest.nvim',
	-- requires = 'MunifTanjim/nui.nvim',
	-- config = function() require'competitest'.setup() end
	--  }

	use("Mofiqul/vscode.nvim")
	use("nyoom-engineering/oxocarbon.nvim")

	use("karb94/neoscroll.nvim")

	-- use {'kevinhwang91/nvim-bqf'}
	-- use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }

	use("voldikss/vim-floaterm") --floaterm

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("mzlogin/vim-markdown-toc") -- 生成markdown 目录

	use("dhruvasagar/vim-table-mode") -- markdown 表格编辑

	use("puremourning/vimspector") --debug plug

	use("xdavidel/hexer.nvim")

	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		-- config = function()
		--   -- you can configure Hop the way you like here; see :h hop-config
		--   require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		--   end
	}) -- 快捷移动

	------------------------------------
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
