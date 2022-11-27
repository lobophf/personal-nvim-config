local HOME_PATH = os.getenv('HOME')
local ECLIPSE_JDT_LS_JAR_PATH =  HOME_PATH .. '/.config/nvim/servers/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local ECLIPSE_JDT_LS_JAR_CONFIG_PATH = HOME_PATH .. '/.config/nvim/servers/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux'
local GOOGLE_STYLE_FORMAT_PATH = HOME_PATH .. '/.config/nvim/formats/google-style.xml'
local WORKSPACE_DIR = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local bundles = { }

-- Debugging
vim.list_extend(bundles, vim.split(vim.fn.glob( HOME_PATH .. '/.config/nvim/servers/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.42.0.jar' ), "\n"))
vim.list_extend(bundles, vim.split(vim.fn.glob( HOME_PATH .. '/.config/nvim/servers/vscode-java-test/server/*.jar' ), "\n"))
vim.list_extend(bundles, vim.split(vim.fn.glob( HOME_PATH .. '/.config/nvim/servers/vscode-java-test/java-extension/com.microsoft.java.test.plugin/target/*.jar'), "\n"))
vim.list_extend(bundles, vim.split(vim.fn.glob( HOME_PATH .. '/.config/nvim/servers/vscode-java-test/java-extension/com.microsoft.java.test.runner/target/*.jar'), "\n"))

-- Decompiling
vim.list_extend(bundles, vim.split(vim.fn.glob( HOME_PATH .. '/.config/nvim/servers/vscode-java-decompiler/server/*.jar'), "\n"))

function setKeymaps()
  local keymap = vim.api.nvim_set_keymap
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
  keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', {})
  keymap('n', '<leader>e', '<cmd>:Lex 30<CR>', {})
  keymap('n', '<leader>o', '<cmd>:lua vim.diagnostic.open_float()<CR>', {})
end

local config = {
  cmd = {
    '/usr/lib/jvm/java-17-openjdk-amd64/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', ECLIPSE_JDT_LS_JAR_PATH,
    '-configuration', ECLIPSE_JDT_LS_JAR_CONFIG_PATH,
    '-data', vim.fn.expand('~/.cache/nvim/workspaces_jdtls/') .. WORKSPACE_DIR 
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
--          {
--             name = "JavaSE-11",
--             path = "/usr/lib/jvm/java-11-openjdk-amd64/"
--          },
          {
             name = "JavaSE-17",
             path = "/usr/lib/jvm/java-17-openjdk-amd64/"
          },
        }
      }
    },
    maven = {
      downloadSources = true,
    },
    implementationsCodeLens = {
      enabled = true,
    },
    referencesCodeLens = {
      enabled = true,
    },
    references = {
      includeDecompiledSources = true,
    },
    format = {
      enabled = true,
      settings = {
        url = GOOGLE_STYLE_FORMAT_PATH,
        profile = "GoogleStyle",
      },
    },
  },
  signatureHelp = { 
    enabled = true
  },
  completion = {
    favoriteStaticMembers = {
      "org.hamcrest.MatcherAssert.assertThat",
      "org.hamcrest.Matchers.*",
      "org.hamcrest.CoreMatchers.*",
      "org.junit.jupiter.api.Assertions.*",
      "java.util.Objects.requireNonNull",
      "java.util.Objects.requireNonNullElse",
      "org.mockito.Mockito.*",
    },
    importOrder = {
      "java",
      "javax",
      "com",
      "org"
    },
  },
  sources = {
    organizeImports = {
      starThreshold = 9999,
      staticStarThreshold = 9999,
    },
  },
  codeGeneration = {
    toString = {
      template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
    },
    useBlocks = true,
  },
  flags = {
    allow_incremental_sync = true,
  },
  on_attach = function(client, bufnr) 
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls.dap').setup_dap_main_class_configs()
    setKeymaps()
  end
}
require('jdtls').start_or_attach(config)
