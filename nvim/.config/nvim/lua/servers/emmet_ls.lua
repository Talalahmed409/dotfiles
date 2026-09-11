-- ================================================================================================
-- TITLE : emmet_ls (Emmet Language Server) LSP Setup
-- ABOUT : Configures Emmet Language Server for web-related (e.g. TS/JS, CSS, Sass, Svelte, Vue)
-- LINKS :
--   > github: https://github.com/aca/emmet-ls
-- ================================================================================================

--- @param capabilities table LSP client capabilities
--- @return nil
return function(capabilities)
  -- Clone the capabilities table so we don't accidentally alter other LSPs
  local emmet_capabilities = vim.deepcopy(capabilities)

  -- Force snippet support to true for Emmet boilerplate expansion
  if emmet_capabilities.textDocument and emmet_capabilities.textDocument.completion then
    emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
  end

  vim.lsp.config("emmet_ls", {
    capabilities = emmet_capabilities, -- Use the modified table
    filetypes = {
      "html",
      "html.php",
      "php",
      "typescript",
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "css",
      "sass",
      "scss",
      "svelte",
      "vue",
    },
  })
end
