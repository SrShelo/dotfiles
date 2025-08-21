local comb = '<Leader>l'
return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'zathura'
    -- See https://wiki.archlinux.org/title/TeX_Live#Installation
    -- and https://wiki.archlinux.org/title/TeX_Live#High-level_wrappers_for_compiling_documents
    -- to install all dependencies to run latex.
    vim.g.vimtex_compiler_method = 'latexmk'
    -- vim.g.maplocalleader = '\\'
    vim.g.maplocalleader = ','
  end,
  keys = {
    {
      comb .. 'c',
      ':VimtexCompile<Cr>',
      mode = 'n',
      desc = 'Compile current LaTex file and keep watching.',
    },
    {
      comb .. 'v',
      ':VimtexView<Cr>',
      mode = 'n',
      desc = 'View the hovered block.',
    },
    {
      comb .. 'S',
      ':VimtexStop<Cr>',
      mode = 'n',
      desc = 'Stop compiler watch changes.',
    },
    {
      comb .. 'C',
      ':VimtexClean<Cr>',
      mode = 'n',
      desc = 'Clean compiler.',
    },
    {
      comb .. 't',
      ':VimtexTocToggle<Cr>',
      mode = 'n',
      desc = 'Toggle TOC.',
    },
    {
      comb .. 'e',
      ':VimtexErrors<Cr>',
      mode = 'n',
      desc = 'Check any errors.',
    },
    {
      comb .. 'i',
      '<C-w>s:VimtexInfo<Cr>',
      mode = 'n',
      desc = 'Show info.',
    },
    {
      comb .. 's',
      ':VimtexStatus<Cr>',
      mode = 'n',
      desc = 'Show compiler status.',
    },
  },
}
