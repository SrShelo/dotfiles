vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = { 'shift:2', 'sbr' }
-- vim.opt.showbreak = '↪ '

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.spell = true
vim.o.spelllang = 'es,en'
-- download dictionaries here: https://ftp.nluug.nl/vim/runtime/spell/
vim.keymap.set({ 'n', 'v', 'o' }, 'j', 'gj', { noremap = true })
vim.keymap.set({ 'n', 'v', 'o' }, 'k', 'gk', { noremap = true })
