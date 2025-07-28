return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },

    current_line_blame = true, -- 默认开启 blame
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- eol / overlay / right_align
      delay = 0,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- 快捷键示例，可按需删减
      map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
      map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview git hunk" })
      map("n", "]g", gs.next_hunk, { desc = "Next Git hunk" })
      map("n", "[g", gs.prev_hunk, { desc = "Prev Git hunk" })
    end,
  },
}
