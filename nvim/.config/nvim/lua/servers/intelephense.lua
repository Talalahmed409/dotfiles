return function(capabilities)
  vim.lsp.config("intelephense", {
    capabilities = capabilities,

    settings = {
      intelephense = {
        files = {
          maxSize = 5000000,
        },
      },
    },
  })
end
