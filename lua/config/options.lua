local opt = vim.opt

-- Set Tab as intend width equals 4 Space
opt.autoindent = true
opt.tabstop = 4
opt.expandtab = false
opt.shiftwidth = 4

-- Show absulute line numbers
opt.relativenumber = false

-- Make yank global
opt.clipboard = "unnamedplus"
