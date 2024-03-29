local function bind_option(options)
	for k, v in pairs(options) do
		if v == true then
			vim.cmd("set " .. k)
		elseif v == false then
			vim.cmd("set no" .. k)
		else
			vim.cmd("set " .. k .. "=" .. v)
		end
	end
end

-- completion symbols
vim.lsp.protocol.completionitemkind = {
	"   (text) ",
	"   (method)",
	"   (function)",
	" F (function)",
	"   (constructor)",
	" ﴲ  (field)",
	"[] (variable)",
	"   (class)",
	" ﰮ  (interface)",
	"   (module)",
	" 襁 (property)",
	"   (unit)",
	"   (value)",
	" 練 (enum)",
	"   (keyword)",
	"   (snippet)",
	"   (color)",
	"   (file)",
	"   (reference)",
	"   (folder)",
	"   (enummember)",
	" ﲀ  (constant)",
	" ﳤ  (struct)",
	"   (event)",
	"   (operator)",
	"   (typeparameter)",
}

local function load_options()
	local global_local = {
		termguicolors = true,
		mouse = "a",
		errorbells = true,
		visualbell = true,
		hidden = true,
		filetype = true,
		fileformats = "unix,mac,dos",
		magic = true,
		virtualedit = "block",
		encoding = "utf-8",
		viewoptions = "folds,cursor,curdir,slash,unix",
		sessionoptions = "curdir,help,tabpages,winsize",
		clipboard = "unnamedplus",
		wildignorecase = true,
		wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.ds_store,**/node_modules/**,**/bower_modules/**",
		backup = false,
		writebackup = false,
		swapfile = false,
		-- undodir = global.cache_dir .. "undo/",
		-- directory = global.cache_dir .. "swap/",
		-- backupdir = global.cache_dir .. "backup/",
		-- viewdir = global.cache_dir .. "view/",
		-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
		history = 2000,
		shada = "!,'300,<50,@100,s10,h",
		backupskip = "/tmp/*,$tmpdir/*,$tmp/*,$temp/*,*/shm/*,/private/var/*,.vault.vim",
		smarttab = true,
		shiftround = true,
		timeout = true,
		ttimeout = true,
		timeoutlen = 500,
		ttimeoutlen = 0,
		updatetime = 100,
		redrawtime = 1500,
		ignorecase = true,
		smartcase = true,
		infercase = true,
		incsearch = true,
		wrapscan = true,
		complete = ".,w,b,k",
		inccommand = "nosplit",
		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --hidden --vimgrep --smart-case --",
		breakat = [[\ \	;:,!?]],
		startofline = false,
		whichwrap = "h,l,<,>,[,],~",
		splitbelow = true,
		splitright = true,
		switchbuf = "useopen",
		backspace = "indent,eol,start",
		diffopt = "filler,iwhite,internal,algorithm:patience",
		completeopt = "menuone,noselect",
		jumpoptions = "stack",
		showmode = false,
		shortmess = "aooticf",
		scrolloff = 2,
		sidescrolloff = 5,
		foldlevelstart = 99,
		ruler = true,
		cursorline = true,
		cursorcolumn = true,
		list = true,
		showtabline = 4,
		winwidth = 30,
		winminwidth = 10,
		pumheight = 15,
		helpheight = 12,
		previewheight = 12,
		showcmd = false,
		cmdheight = 2,
		cmdwinheight = 5,
		equalalways = false,
		laststatus = 2,
		display = "lastline",
		showbreak = "↳  ",
		listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
		pumblend = 10,
		winblend = 10,
		autoread = true,
		autowrite = true,
	}

	local bw_local = {
		undofile = true,
		synmaxcol = 2500,
		formatoptions = "1jcroql",
		textwidth = 80,
		expandtab = true,
		autoindent = true,
		tabstop = 4,
		shiftwidth = 4,
		softtabstop = -1,
		breakindentopt = "shift:2,min:20",
		wrap = false,
		linebreak = true,
		number = true,
		relativenumber = false,
		foldenable = true,
		signcolumn = "yes",
		conceallevel = 0,
		concealcursor = "niv",
	}

	for name, value in pairs(global_local) do
		vim.o[name] = value
	end

	vim.opt.termguicolors = true
	vim.o.background = "dark" -- or "light" for light mode
	vim.cmd([[colorscheme visual_studio_code]])
	bind_option(bw_local)
end

load_options()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([["au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif"]])
