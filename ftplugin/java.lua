local JAR_PATH =  os.getenv('HOME') .. '/.config/nvim/servers/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/servers/jdt-language-server/config_linux'
local DEBUG_PATH = os.getenv('HOME') .. '/.config/nvim/debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.36.0.jar'
-- local DEBUG_TEST_PATH = os.getenv('HOME') ..'/.config/nvim/vscode-java-test/server/com.microsoft.java.test.plugin-0.37.1.jar'
local DEBUG_TEST_PATH = os.getenv('HOME') ..'/.config/nvim/vscode-java-test/server/*.jar'


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local WORKSPACE_DIR = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local util = require('jdtls.util')
local dap = require("dap")
require('jdtls').setup_dap({ hotcodereplace = 'auto' })
 
dap.adapters.java = function(callback)
  util.execute_command({ command = 'vscode.java.startDebugSession' }, function(err0, port)
  assert(not err0, vim.inspect(err0))
  callback({
    type = 'server',
    host = '127.0.0.1',
    port = port,
  })
  end)
end

-- Debugging
local bundles = {
  vim.fn.glob( DEBUG_PATH ),
}
vim.list_extend(bundles, vim.split(vim.fn.glob( DEBUG_TEST_PATH ), "\n"))

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', JAR_PATH,
    '-configuration', CONFIG_PATH,
    '-data', vim.fn.expand('~/.cache/nvim/workspaces_jdtls/') .. WORKSPACE_DIR 
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  init_options = {
      bundles = bundles,
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr) 
    require('jdtls.dap').setup_dap_main_class_configs()
  end
}

require('jdtls').start_or_attach(config)
