local status_ok, bufferline = pcall(require, 'bufferline')    
if not status_ok then    
  vim.notify('bufferline not found!')    
  return    
end 

vim.opt.termguicolors = true
bufferline.setup({
  options = {
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
  }
})
