local haslsp, _ =  pcall(require, 'lsp-zero') 


if haslsp then
lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
	'rust_analyzer',
	'sumneko_lua',
	'gopls',
})
lsp.setup()
end
