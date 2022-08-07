------------------------------------
-- CSCOPE settings for nvim in lua
------------------------------------

if io.open("cscope.out", "r") ~= nil then
    vim.opt.csprg = "/opt/homebrew/bin/cscope"
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
	-- cscope_search = function(operation, default_symbol)
	-- 	local new_symbol = vim.fn.input(sym_map[operation] .. " (default: '" .. default_symbol .. "'): ")
	-- 	if "" ~= new_symbol then
	-- 		vim.cmd(":cs find " .. operation .. " " .. new_symbol)
	-- 	else
	-- 		vim.cmd(":cs find " .. operation .. " " .. default_symbol)
	-- 	end
	-- 	vim.cmd("copen")
	-- end

	cscope_search = function(operation, default_symbol)
		vim.cmd(":cs find " .. operation .. " " .. default_symbol)
		vim.cmd("copen")
	end

	-- Mappings
	local opts = { noremap = true, silent = true }
   --Add leader shortcuts
end
