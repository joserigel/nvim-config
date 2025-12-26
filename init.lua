if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    require("config.lazy")
    require("set")
    require("remap")
    require("treesitter")
    require("nvimtree")
    require("linesetup")
    require("lsp")
    require("git")
    require("debugger")
end


