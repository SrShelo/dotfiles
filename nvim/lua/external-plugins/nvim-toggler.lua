return {
  'nguyenvukhang/nvim-toggler', -- Toggle word like on <-> off and custom ones
  opts = {
    inverses = {
      ['vim'] = 'emacs',
    },
    remove_default_keybinds = true,
    remove_default_inverses = false,
    autoselect_longest_match = false,
  },
  keys = {
    {
      '<Leader>i',
      function()
        require('nvim-toggler').toggle()
      end,
      desc = 'Toggle word value under cursor',
      mode = 'n',
    },
  },
}
