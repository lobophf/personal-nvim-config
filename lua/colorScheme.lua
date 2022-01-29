function setColorScheme(colorScheme)
  local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorScheme)
  
  if not status_ok then
      vim.notify('colorscheme ' .. colorScheme .. ' not found!')
      return
  end
end
