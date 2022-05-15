local MAIN_PATH = os.getenv('HOME') .. '/.local/share/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository' 
local JAR_PATH = MAIN_PATH .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar' 
local CONFIG_PATH = MAIN_PATH .. '/config_linux'

local function debug_stuff()

  local util = require('jdtls.util')
  local dap = require("dap")
  --require('jdtls').setup_dap({ hotcodereplace = 'auto' })

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
  
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local WORKSPACE_DIR = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
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
    bundles = {os.getenv('HOME') .. '/.config/nvim/debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.36.0.jar'},
  },
  capabilities = capabilities
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.

debug_stuff()
require('jdtls').start_or_attach(config)
