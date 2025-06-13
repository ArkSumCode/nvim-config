local opt = vim.opt

-- Set Tab as intend width equals 4 Space
opt.autoindent = true
opt.tabstop = 4
opt.expandtab = false
opt.shiftwidth = 4

-- Show absulute line numbers
opt.relativenumber = false

-- Better colors
vim.opt.termguicolors = true

-- Aways current working dir instead of project dir
vim.g.root_spec = { "cwd" }
