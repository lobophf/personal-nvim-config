local status_ok, moonlight = pcall(require, 'moonlight')    
if not status_ok then    
  vim.notify('moonlight not found!')    
  return    
end    

moonlight.set()
