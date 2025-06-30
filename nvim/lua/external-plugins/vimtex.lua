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
}
