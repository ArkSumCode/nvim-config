local opt = vim.opt
local glob = vim.g

-- Set Tab as intend width equals 4 Space
opt.autoindent = true
opt.tabstop = 4
opt.expandtab = false
opt.shiftwidth = 4

-- Show absulute line numbers
opt.relativenumber = false

-- Better colors
opt.termguicolors = true

-- Aways current working dir instead of project dir
glob.root_spec = { "cwd" }

-- Rust diagnostics
glob.lazyvim_rust_diagnostics = "rust-analyzer"

-- Windows undotree fix, might disable on linux for undo tree
glob.undotree_DiffCommand = "FC"
