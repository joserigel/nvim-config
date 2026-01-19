return {
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
    opts = {
      lang = {
        tsx = {
          "// %s", -- default commentstring when no treesitter node matches
          "/* %s */",
          call_expression = "// %s", -- specific commentstring for call_expression
          jsx_attribute = "// %s",
          jsx_element = "{/* %s */}",
          jsx_fragment = "{/* %s */}",
          spread_element = "// %s",
          statement_block = "// %s",
        },
      }
    }
  }
}
