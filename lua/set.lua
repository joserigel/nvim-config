require("solarized-osaka").setup({
  transparent = true,
  styles = {
    comments = { italic = true },
  },
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

vim.cmd.colorscheme("solarized-osaka")

-- Clipboard to system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tab size to 2 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set wrap to true
vim.opt.wrap = true


