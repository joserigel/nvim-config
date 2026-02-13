if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    require("config.lazy")
    require("nvimtree")
    require("treesitter")
    require("set")
    require("remap")
    require("linesetup")
    require("lsp")
    require("git")
    require("debugger")
end


