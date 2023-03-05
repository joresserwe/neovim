local status_lsp, _ = pcall(require, "lspconfig")
if not status_lsp then
	return
end

require("bin.plugins.lsp.mason")
require("bin.plugins.lsp.handlers").setup()
require("bin.plugins.lsp.null-ls")
