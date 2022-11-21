local status_ok, nvimTreesitter = pcall(require, 'nvim-treesitter.configs')    
if not status_ok then    
  vim.notify('nvim-treesitter not found!')    
  return    
end    

nvimTreesitter.setup {
  indent = {
    enable = false
  },

  highlight = {
    enable = true,
    disable = {'c'},
  },
}
