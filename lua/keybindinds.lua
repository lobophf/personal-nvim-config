local keymap = vim.api.nvim_set_keymap

-- Numbers && Relative Numbers
keymap('n', '<leader>n', '<cmd>:set nonumber! | :set norelativenumber!<CR>', {})

-- Telescope
keymap('n', '<tab>f', '<cmd>:Telescope find_files<CR>', {})
keymap('n', '<tab>d', '<cmd>:Telescope diagnostics<CR>', {})
keymap('n', '<tab>g', '<cmd>:Telescope git_commits<CR>', {})
keymap('n', '<tab>k', '<cmd>:Telescope keymaps<CR>', {})
keymap('n', '<tab>fg','<cmd>:Telescope live_grep<CR>', {})

-- Copy & Paste from / to clipboard
keymap('v', '<leader>y', '"+y', {})
keymap('n', '<leader>p', '"+p', {})

-- Files Tree
keymap('n', '\'', '<cmd>:NvimTreeToggle<CR>', {})
keymap('n', '<leader>z', '<cmd>:NvimTreeCollapse<CR>', {})

-- Debug
keymap('n', '<F1>', [[<cmd>lua require'dap'.continue()<CR>]], {})
keymap('n', '<F2>', [[<cmd>:lua require'dap'.step_into()<CR>]], {})
keymap('n', '<F3>', [[<cmd>:lua require'dap'.step_over()<CR>]], {})
keymap('n', '<F4>', [[<cmd>:lua require'dap'.step_out()<CR>]], {})
keymap('n', '<F5>', [[<cmd>:lua require'dap'.step_back()<CR>]], {})
keymap('n', '<F6>', [[<cmd>:lua require'dap'.step_run_last()<CR>]], {})
keymap('n', '<F7>', [[<cmd>:lua require'dap'.step_terminate()<CR>]], {})
keymap('n', '<leader>b', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]], {})
keymap('n', '<leader>cb', [[<cmd>:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], {})
keymap('n', '<leader>lp', [[<cmd>:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '<CR>]], {})
keymap('n', '<leader>dr', [[<cmd>:lua require'dap'.repl.open()<CR>]], {})
keymap('n', '<leader>rl', [[<cmd>:lua require'dap'.run_last()<CR>]], {})
keymap('n', '<leader>db', [[<cmd>:lua require'dapui'.toggle()<CR>]], {})
keymap('n', '<leader>tm', [[<cmd>:lua require'jdtls'.test_nearest_method()<CR>]], {})
keymap('n', '<leader>tc', [[<cmd>:lua require'jdtls'.test_class()<CR>]], {})

-- BufferLine
keymap('n', '<c-x>', '<Cmd>BufferLineCycleNext<CR>', {})
keymap('n', '<c-c>', '<Cmd>bdelete<CR>', {})


-- keymap('n', '<C-p>', [[<cmd>:lua print("hi")<CR>]], {})
