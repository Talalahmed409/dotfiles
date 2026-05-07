return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    { "zm", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
    { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open in cwd" },
    { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume last session" },
  },
  opts = {
  open_for_directories = false,

  -- ⭐ Let Yazi handle open internally
  open_file_function = nil,

  keymaps = {
    show_help = "<f1>",
  },

  yazi_floating_window_border = "none",
}
,
}
