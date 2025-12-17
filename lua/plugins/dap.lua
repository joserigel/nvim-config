return {
  {
    "jay-babu/mason-nvim-dap.nvim"
  },
  {
    "rcarriga/nvim-dap-ui",
    -- virtual text for the debugger
     dependencies = { "nvim-neotest/nvim-nio" },
    -- stylua: ignore
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
  }
}
