return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "php_cs_fixer" },
      -- keep your other filetypes here (lua = { "stylua" }, etc.)
    },
    formatters = {
      php_cs_fixer = {
        args = {
          "fix",
          "$FILENAME",
          "--rules=@PSR12",
          "--using-cache=no",
          "--no-interaction",
          "--quiet",
        },
      },
    },
  },
}
