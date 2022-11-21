local status_ok, colorScheme = pcall(require, 'colorScheme')    
if not status_ok then    
  vim.notify('colorScheme not found!')    
  return    
end    

vim.g.tokyonight_style = "night" -- try 'night', 'storm' or 'day'
vim.g.tokyonight_colors = { 
  hint = "orange", 
  error = "#ff0000" 
}

local colorscheme = 'tokyonight'
setColorScheme(colorscheme)

