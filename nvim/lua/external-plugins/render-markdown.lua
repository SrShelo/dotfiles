-- https://github.com/MeanderingProgrammer/render-markdown.nvim
-- wiki: https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'quarto' },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  keys = {
    {
      '<Leader>tm',
      ':RenderMarkdown toggle<CR>',
      desc = 'Toggle markdown renderer',
      mode = 'n',
    },
  },
  opts = {
    render_modes = { 'n', 'c', 't' },
    anti_conceal = {
      enabled = true,
      disabled_modes = false,
      above = 0,
      below = 0,
      ignore = {
        code_background = true,
        indent = true,
        sign = true,
        virtual_lines = true,
      },
    },
    latex = { enabled = false },
    heading = {
      sign = false,
      position = 'inline',
      width = 'block',
      -- left_margin = 0.5,
      left_pad = 0.1,
      right_pad = 0.1,
    },
    -- paragraph = {
    --   left_margin = 0.5,
    --   -- min_width = 30,
    -- },
  },
}
