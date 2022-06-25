local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("lsp.config")
require("lsp.lsp-installer")
require("lsp.handlers").setup()
require("lsp.cmp")
-- require("lsp.coq")
