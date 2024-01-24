-- Set the path to include the current working directory
vim.opt.path:append('**')

-- Set the clipboard to use the unnamed register
vim.opt.clipboard:prepend('unnamed')

-- Make the undo history persistent
vim.opt.undofile = true

-- Set a directory to store the undo history
vim.opt.undodir = vim.fn.expand('~/.vimundo')

-- Set backspace behavior
vim.opt.backspace = {'indent', 'eol', 'start'}

-- Set the format program
vim.opt.formatprg = 'par'

-- Disable polyglot vim syntax for Python
vim.g.polyglot_disabled = {'python'}

-- Unified color scheme (default: dark)
vim.cmd('colorscheme seoul256')

-- Switch background to dark
vim.opt.background = 'dark'
