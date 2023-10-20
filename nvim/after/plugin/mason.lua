 require("mason").setup()
    mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = {
        "tflint",
        "gopls",
        "golangci_lint_ls",
      }
    })
