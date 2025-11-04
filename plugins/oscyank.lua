return {
  "ojroques/vim-oscyank",
  event = "TextYankPost", -- 在第一次 yank 时懒加载
  cond = function()
    -- 仅在 SSH 会话中启用 (检测常见 SSH 环境变量)
    return vim.env.SSH_CONNECTION ~= nil or vim.env.SSH_TTY ~= nil or vim.env.SSH_CLIENT ~= nil
  end,
  config = function()
    vim.api.nvim_create_autocmd("TextYankPost", {
      pattern = "*",
      callback = function()
        if vim.v.event.operator == "y" and vim.v.event.regname == "" then vim.cmd 'OSCYankReg "' end
      end,
    })
  end,
}
