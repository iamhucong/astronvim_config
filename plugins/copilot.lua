local copilot_setup_done = false

return {
  "github/copilot.vim",
  event = "VeryLazy",
  autoStart = true,
  config = function()
    vim.defer_fn(function() vim.cmd "Copilot enable" end, 1000) -- 延迟 1 秒再初始化
  end,
  keys = {
    -- 接受建议 Alt+Enter
    {
      "<A-CR>",
      function() return vim.fn["copilot#Accept"] "<CR>" end,
      expr = true,
      replace_keycodes = false,
      mode = "i",
      desc = "Accept Copilot suggestion",
    },
    -- 下一个建议 Alt+]
    {
      "<A-]>",
      "<Plug>(copilot-next)",
      desc = "Next Copilot suggestion",
      mode = "i",
    },
    -- 上一个建议 Alt+[
    {
      "<A-[>",
      "<Plug>(copilot-previous)",
      desc = "Previous Copilot suggestion",
      mode = "i",
    },
  },
  config = function() vim.g.copilot_no_tab_map = true end,
}
