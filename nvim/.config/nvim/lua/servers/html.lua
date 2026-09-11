--- @param capabilities table LSP client capabilities
--- @return nil
return function(capabilities)
  vim.lsp.config("html", {
    capabilities = capabilities,
    filetypes = { "html" },
  })
end
