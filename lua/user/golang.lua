-- coc configuration
vim.cmd "let g:coc_global_extensions = [ 'coc-snippets', 'coc-go','coc-json']"
vim.g.go_fmt_command = "goimports"
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'
vim.g.go_highlight_functions = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_auto_sameids = 1
vim.g.go_version_warning = 0
vim.g.go_auto_type_info = 1
vim.g.go_def_mapping_enabled = 0

vim.cmd 'let g:LanguageClient_settingsPath = "/home/sgm/.config/nvim/settings.json"'
