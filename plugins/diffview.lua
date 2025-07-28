return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
    "DiffviewClose",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Git Diff View" },
    { "<leader>gD", "<cmd>DiffviewClose<CR>", desc = "Close Git Diff View" },
  },
}
