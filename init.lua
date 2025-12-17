if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end

require("config.lazy")
require("set")
require("remap")
require("treesitter")
require("nvimtree")
require("linesetup")
require("lsp")
require("git")
require("debugger")
