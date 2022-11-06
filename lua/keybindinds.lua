local keymap = vim.api.nvim_set_keymap
-- JAVA_LSP
keymap('n', 'gp',':e#<CR>',{})
keymap('n', 'gt', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {})
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})
keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', {})
keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', {})
keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {})
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {})
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {})
keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {})
keymap('n', '<leader>e', '<cmd>:Lex 30<CR>', {})

-- Numbers && Relative Numbers
keymap('n', '<leader>n', '<cmd>:set nonumber! | :set norelativenumber!<CR>', {})

-- Telescope
keymap('n', '<tab>f', '<cmd>:Telescope find_files<CR>', {})

-- Copy & Paste from / to clipboard
keymap('v', '<leader>y', '"+y', {})
keymap('n', '<leader>p', '"+p', {})

-- Files Tree
keymap('n', '\'', '<cmd>:NvimTreeToggle<CR>', {})
keymap('n', '<BSlash>z', '<cmd>:NvimTreeCollapse<CR>', {})

-- Debug
keymap('n', '<F1>', [[<cmd>lua require'dap'.continue()<CR>]], {})
keymap('n', '<F2>', [[<cmd>:lua require'dap'.step_over()<CR>]], {})
keymap('n', '<F3>', [[<cmd>:lua require'dap'.step_into()<CR>]], {})
keymap('n', '<F4>', [[<cmd>:lua require'dap'.step_out()<CR>]], {})
keymap('n', '<Leader>b', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], {})
keymap('n', '<Leader>cb', [[<cmd>:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], {})
keymap('n', '<Leader>lp', [[<cmd>:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '<CR>]], {})
keymap('n', '<Leader>dr', [[<cmd>:lua require'dap'.repl.open()<CR>]], {})
keymap('n', '<Leader>rl', [[<cmd>:lua require'dap'.run_last()<CR>]], {})
