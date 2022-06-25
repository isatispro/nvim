------------------------------------
-- CSCOPE settings for nvim in lua
------------------------------------

if io.open("cscope.out", "r") ~= nil then
    vim.opt.csprg = "/usr/bin/cscope"
	-- use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	vim.opt.cscopetag = true
	-- check cscope for definition of a symbol before checking ctags: set to 1
	-- if you want the reverse search order.
	vim.opt.csto = 0
	vim.opt.cst = true
	-- show msg when cscope db added
	vim.opt.cscopeverbose = true
	-- results in quickfix window
	vim.opt.cscopequickfix = "s-,g-,c-,t-,e-,f-,i-,d-,a-"
	-- add cscope database in current directory
	vim.cmd("cs add cscope.out")

	-- define key table for input strings
	local sym_map = {
		["s"] = "Find this symbol",
		["g"] = "Find this global defination",
		["c"] = "Find functions calling this function",
		["t"] = "Find this text string",
		["e"] = "Find this egrep pattern",
		["f"] = "Find this file",
		["i"] = "Find files #including this file",
		["d"] = "Find functions called by this function",
		["a"] = "Find places where this symbol is assigned a value",
	}

	-- function to print xcscpoe.el like prompts
	cscope_search = function(operation, default_symbol)
		local new_symbol = vim.fn.input(sym_map[operation] .. " (default: '" .. default_symbol .. "'): ")
		if "" ~= new_symbol then
			vim.cmd(":cs find " .. operation .. " " .. new_symbol)
		else
			vim.cmd(":cs find " .. operation .. " " .. default_symbol)
		end
		vim.cmd("copen")
	end

	-- Mappings
	local opts = { noremap = true, silent = true }
   --Add leader shortcuts
   vim.api.nvim_set_keymap("n", "<space>cs", [[<cmd>lua cscope_search('s', vim.fn.expand("<cword>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>cg", [[<cmd>lua cscope_search('g', vim.fn.expand("<cword>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>cc", [[<cmd>lua cscope_search('c', vim.fn.expand("<cword>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>ct", [[<cmd>lua cscope_search('t', vim.fn.expand("<cword>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>ce", [[<cmd>lua cscope_search('e', vim.fn.expand("<cword>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>cf", [[<cmd>lua cscope_search('f', vim.fn.expand("<cfile>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>ci", [[<cmd>lua cscope_search('i', vim.fn.expand("<cfile>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>cd", [[<cmd>lua cscope_search('d', vim.fn.expand("<cword>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "<space>ca", [[<cmd>lua cscope_search('a', vim.fn.expand("<cword>"))<cr>]], opts)
   vim.api.nvim_set_keymap("n", "cn", ":cnext<cr>", opts)
   vim.api.nvim_set_keymap("n", "cp", ":cprevious<cr>", opts)
   vim.api.nvim_set_keymap("n", "cc", ":cclose<cr>", opts)
   vim.api.nvim_set_keymap("n", "cf", ":cfirst<cr>", opts)
   vim.api.nvim_set_keymap("n", "cl", ":clast<cr>", opts)

end
