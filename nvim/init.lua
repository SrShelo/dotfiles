-- The very first think to do is set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ OPTIONS ]]
-- See all options with :help option-list

-- tabs and space behavior
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 0

vim.g.have_nerd_font = true

-- See relative line numbers and current line number
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse in (almost) all modes
vim.o.mouse = 'a'
vim.o.mousescroll = 'ver:1'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- This is how new splits are opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimum number of lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- Should a dialog be raised to ask if the file should be saved when :q fails?
vim.o.confirm = false

-- [[ BASIC KEYMAPS ]]
--  See `:help vim.keymap.set()`

-- Remmaping some
-- NOTE: Actions wich are keybind are interpreted as default keybinds. E.g. if I bind 'u'to 'a', then '<C-z>' to 'u' (or vice versa), the action of '<C-z>' will be the same as ':undo' and not 'a'.
--
-- Scheme
--                     # Direction(n)
--   # Insert modes    aA       sS
--   yY uU iI oO pP    zZ       xX
--         |                |
--         V                V
--   cC aA iI oO rR    h^  k<PgUp>
--                     j<PgDn>  l$
-- - <C-c> & <C-v> -> copy & paste (n, v, i)
-- - changed v to r for visual modes
--
--   qQ <-> bB
--   rR  -> aA
--   uU  -> rR
--  C-r  ->

-- Insert modes
vim.keymap.set({ 'n', 'v' }, 'u', 'r')
vim.keymap.set({ 'n', 'v' }, 'U', 'R')
vim.keymap.set('n', 'r', 'a')
vim.keymap.set('n', 'R', 'A')

-- Custom DIRECTION and MOTION keys (just for normal mode)
-- This comes from my filosofy of configs I use with WMs: ergonomics, and giving
-- my left hand enough control to leave my right hand stable on the mouse so I
-- can save myself the time of switching the right hand back and forth.
-- Also this config will be very frendly with who lost right hand, and a little less
-- with who lost left hand.
-- now it's more confortable to me, navigate trhouth all my system
vim.keymap.set('n', 'a', 'h')
vim.keymap.set('n', 'A', '0')
vim.keymap.set('n', 's', 'k', { silent = true })
vim.keymap.set('n', 'S', '<PageUp>')
vim.keymap.set('n', 'z', 'j')
vim.keymap.set('n', 'Z', '<PageDown>')
vim.keymap.set('n', 'x', 'l')
vim.keymap.set('n', 'X', '$')
-- Swap q <-> b
vim.keymap.set('n', 'q', 'b')
vim.keymap.set('n', 'Q', 'B')
vim.keymap.set('n', 'b', 'q')
vim.keymap.set('n', 'B', 'Q')

-- Clipboard
vim.keymap.set({ 'n', 'v' }, '<C-c>', 'y')
vim.keymap.set({ 'n', 'v' }, '<C-S-c>', 'Y')
vim.keymap.set('n', '<C-c><C-c>', 'yy')
-- vim.keymap.set('n', 'y<C-c>', 'yy')
-- vim.keymap.set({ 'n', 'v' }, '<C-v>', 'p')
-- vim.keymap.set({ 'n', 'v' }, '<C-S-v>', 'P')
vim.keymap.set('i', '<C-v>', '<C-r>+')
vim.keymap.set('i', '<C-S-v>', '<C-r>+')
vim.keymap.set('i', '<C-c>', '<Esc>v')
vim.keymap.set('i', '<C-c><C-c>', 'yy')

-- History
vim.keymap.set('n', '<C-z>', 'u', { desc = 'Undo' })
vim.keymap.set('n', '<C-S-z>', '<C-r>', { desc = 'Redo' })
vim.keymap.set('i', '<C-z>', '<Esc>ui', { desc = 'Undo' })
vim.keymap.set('i', '<C-S-z>', '<Esc><C-r>a', { desc = 'Redo' })

-- Visual mode
vim.keymap.set({ 'n', 'v' }, '<C-A-v>', '<C-v>')

-- misc
vim.keymap.set('n', '<C-s>', 'z')
vim.keymap.set('n', '<C-S-s>', 'Z')
vim.keymap.set('n', '<C-r>', '')
vim.keymap.set('n', '<C-f>', '')
vim.keymap.set('n', '<C-b>', '')

-- Disabling arrow keys in normal and visual modes to learn vim really well...
vim.keymap.set({ 'n', 'v' }, '<Left>', '')
vim.keymap.set({ 'n', 'v' }, '<Up>', '')
vim.keymap.set({ 'n', 'v' }, '<Down>', '')
vim.keymap.set({ 'n', 'v' }, '<Right>', '')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use ALT+<aszx> to switch between windows (based on my qutebrowser config)
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<A-a>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-x>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-z>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-s>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<A-S-a>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<A-S-x>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<A-S-z>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<A-S-s>', '<C-w>K', { desc = 'Move window to the upper' })

vim.keymap.set('n', '<A-C-a>', '<C-w><', { desc = 'Decrease window width' })
vim.keymap.set('n', '<A-C-x>', '<C-w>>', { desc = 'Increase window width' })
vim.keymap.set('n', '<A-C-z>', '<C-w>-', { desc = 'Decrease window height' })
vim.keymap.set('n', '<A-C-s>', '<C-w>+', { desc = 'Increase window height' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight yanked text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ PLUGINS ]]
require('lazy').setup({
  require 'external-plugins.autopairs', -- Autocomplete symbols with their pair (e.g. '{' with '}')
  require 'external-plugins.neo-tree', -- File explorer inside neovim
  require 'external-plugins.which-key', -- Suggest keys for combinations
  require 'external-plugins.gitsigns', -- Git functionalitty
  require 'external-plugins.telescope', -- Fuzzy finder
  require 'external-plugins.conform',
  require 'external-plugins.blink', -- Autocompletion
  require 'external-plugins.nvim-treesitter', -- Highlight, edit and navigate code
  require 'external-plugins.indent-line', -- See indentation guide lines
  require 'external-plugins.vimtex', -- LaTeX support
  require 'external-plugins.quarto-nvim', -- Quarto plugin
  require 'external-plugins.yazi', -- Use yazi inside neovim

  -- LSP Plugins
  require 'external-plugins.lazydev',
  require 'external-plugins.nvim-lspconfig',

  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- Themes
  require 'themes.neonord',
  require 'themes.tokyonight',
  require 'themes.kanagawa',
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      }

      vim.o.background = 'dark'
      vim.cmd.colorscheme 'gruvbox'
    end,
    opt = {},
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      -- https://github.com/echasnovski/mini.nvim/blob/main/doc/mini-surround.txt

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- CONFIG EXTERNAL PLUGINS
require 'external-plugins.config.autopairs'
