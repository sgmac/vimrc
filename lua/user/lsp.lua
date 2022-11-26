local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mason").setup({
 ui = {
 icons = {
    package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

require'lspconfig'.gopls.setup{}
