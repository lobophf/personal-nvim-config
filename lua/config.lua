vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("me", {clear = true}),
--  pattern = "*.java",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.g.bufferline_echo = 0
    vim.g.shortmess = at
    vim.g.cmdheight = 2
    vim.bo.modifiable = true
  end,
})
