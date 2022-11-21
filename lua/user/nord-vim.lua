local status_ok, colorscheme = pcall(require, 'colorscheme')    
if not status_ok then    
  vim.notify('colorscheme not found!')    
  return    
end    

local colorscheme = 'nord'
setColorScheme(colorscheme)
