-- Quarto is for writting papers and more.
-- see: https://github.com/quarto-dev/quarto-nvim

local comb = '<Leader>q'

local function send_to_terminal_or_create(cmd)
  -- Look for a opened terminal
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' then
      local job_id = vim.b[buf].terminal_job_id
      if job_id then
        vim.fn.chansend(job_id, cmd .. '\n')
        return
      end
    end
  end

  -- If no terminal, open a new one.
  vim.cmd 'tabnew'
  vim.cmd 'terminal'
  vim.defer_fn(function()
    local term_buf = vim.api.nvim_get_current_buf()
    local job_id = vim.b[term_buf].terminal_job_id
    if job_id then
      vim.fn.chansend(job_id, cmd .. '\n')
    end
  end, 100)
end
-- #####
local function send_to_named_terminal_or_create(cmd, tag)
  -- Look for an opened terminal with the specified tag
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' and vim.b[buf][tag] then
      local job_id = vim.b[buf].terminal_job_id
      if job_id then
        vim.fn.chansend(job_id, cmd .. '\n')
        return
      end
    end
  end

  -- If no terminal, open a new one and tag it.
  vim.cmd 'tabnew'
  vim.cmd 'terminal'
  vim.defer_fn(function()
    local term_buf = vim.api.nvim_get_current_buf()
    vim.b[term_buf][tag] = true -- etiqueta personalizada
    local job_id = vim.b[term_buf].terminal_job_id
    if job_id then
      vim.fn.chansend(job_id, cmd .. '\n')
    end
  end, 100) -- waits 100 ms to terminal be opened.
end
-- #####
local function vanilla_notify(msg)
  vim.cmd('echom "' .. msg .. '"')
  -- vim.cmd 'sleep 1000m'
  -- vim.cmd 'echo ""'
end

return {
  'quarto-dev/quarto-nvim',
  enabled = true,
  dependencies = {
    'jmbuhr/otter.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      comb .. 'a',
      ':QuartoActivate<Cr>',
      mode = 'n',
      desc = 'Activate Quarto',
    },
    {
      comb .. 'rr',
      function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
        local cmd = 'quarto render ' .. vim.fn.fnameescape(filename)
        send_to_named_terminal_or_create(cmd, 'quarto_terminal')
        vanilla_notify('Quarto. Rendering ' .. filename .. '...')
      end,
      mode = 'n',
      desc = 'Render current file to all formats',
    },
    {
      comb .. 'rh',
      function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
        local cmd = 'quarto render ' .. vim.fn.fnameescape(filename) .. ' --to html'
        send_to_named_terminal_or_create(cmd, 'quarto_terminal')
        vanilla_notify('Quarto. Rendering ' .. filename .. ' to HTML...')
      end,
      mode = 'n',
      desc = 'Render current file to HTML',
    },
    {
      comb .. 'rp',
      function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
        local cmd = 'quarto render ' .. vim.fn.fnameescape(filename) .. ' --to pdf'
        send_to_named_terminal_or_create(cmd, 'quarto_terminal')
        vanilla_notify('Quarto. Rendering ' .. filename .. ' to PDF...')
      end,
      mode = 'n',
      desc = 'Render current file to PDF',
    },
    {
      comb .. 're',
      function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
        local cmd = 'quarto render ' .. vim.fn.fnameescape(filename) .. ' --to epub'
        send_to_named_terminal_or_create(cmd, 'quarto_terminal')
        vanilla_notify('Quarto. Rendering ' .. filename .. ' to EPUB...')
      end,
      mode = 'n',
      desc = 'Render current file to EPUB',
    },
    {
      comb .. 'Rr',
      ':!quarto render<Cr>',
      mode = 'n',
      desc = 'Render all formats for current directory',
    },
    {
      comb .. 'Rh',
      ':!quarto render --to html<Cr>',
      mode = 'n',
      desc = 'Render to HTML all on current directory',
    },
    {
      comb .. 'Rp',
      ':!quarto render --to pdf<Cr>',
      mode = 'n',
      desc = 'Render to PDF all on current directory',
    },
    {
      comb .. 'pp',
      ':QuartoPreview<Cr>',
      mode = 'n',
      desc = 'Open new preview for Quarto',
    },
    {
      comb .. 'pn',
      ':QuartoPreviewNoWatch<Cr>',
      mode = 'n',
      desc = 'Open new preview with no watch for Quarto',
    },
    {
      comb .. 'pu',
      ':QuartoUpdatePreview<Cr>',
      mode = 'n',
      desc = 'Update preview',
    },
    {
      comb .. 'pc',
      ':QuartoClosePreview<Cr>',
      mode = 'n',
      desc = 'Close preview',
    },
  },
}
