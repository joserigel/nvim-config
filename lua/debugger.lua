require("mason").setup()
require("mason-nvim-dap").setup({
  ensure_installed = { "cppdbg" },
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  }
})
require("mason-lspconfig").setup()

local dap = require("dap")
local dapui = require("dapui")
dapui.setup()


-- keys = {
--       { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
--       { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "x"} },
--     },

vim.keymap.set("n",
  '<leader>du',  function() dapui.toggle({}) end, { desc = "DAP UI"})
vim.keymap.set({"n", "x"},
  '<leader>de',  function() dapui.eval() end, { desc = "Eval"})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end


vim.keymap.set("n",
  "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Breakpoint Condition" })
vim.keymap.set("n",
  "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n",
  "<leader>dc", function() dap.continue() end, { desc = "Run/Continue" })
vim.keymap.set("n",
  "<leader>da", function() dap.continue({ before = get_args }) end, { desc = "Run with Args" })
vim.keymap.set("n",
  "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })
vim.keymap.set("n",
  "<leader>dg", function() dap.goto_() end, { desc = "Go to Line (No Execute)" })
vim.keymap.set("n",
  "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
vim.keymap.set("n",
  "<leader>dj", function() dap.down() end, { desc = "Down" })
vim.keymap.set("n",
  "<leader>dk", function() dap.up() end, { desc = "Up" })
vim.keymap.set("n",
  "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })
vim.keymap.set("n",
  "<leader>do", function() dap.step_out() end, { desc = "Step Out" })
vim.keymap.set("n",
  "<leader>dO", function() dap.step_over() end, { desc = "Step Over" })
vim.keymap.set("n",
  "<leader>dP", function() dap.pause() end, { desc = "Pause" })
vim.keymap.set("n",
  "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })
vim.keymap.set("n",
  "<leader>ds", function() dap.session() end, { desc = "Session" })
vim.keymap.set("n",
  "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })
vim.keymap.set("n",
  "<leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/joserigel/.vscode/extensions/ms-vscode.cpptools-1.29.3-linux-x64/debugAdapters/bin/OpenDebugAD7",
}


dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false
      }
    }
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false
      }
    }
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.c
