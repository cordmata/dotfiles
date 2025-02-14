local g = vim.g         -- globals
local opt = vim.opt     -- options

g.mapleader = " "

-- Colors
g.t_co = 256
g.background = "dark"
g.have_nerd_font = true
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- Context
opt.colorcolumn = '80'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.signcolumn = "yes"           -- str:  Show the sign column
opt.backup = false               -- bool: More trouble than it's worth
opt.clipboard = 'unnamedplus'    -- str:  System clipboard
opt.scrolloff = 8                -- num:  Chars before moving the page window down
opt.sidescrolloff = 8
opt.wrap = false

-- Filetypes
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- Search
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- Whitespace
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

-- Splits
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- Spellcheck
opt.spelllang = 'en_us'
opt.spell = false

-- create a Browse command to enable GBrowse when netrw is disabled
vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system { 'open', opts.fargs[1] }
  end,
  { nargs = 1 }
)

local function open_scratch_buffer()
  local current_win = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local right_win = nil

  local scratch = vim.fn.bufnr('__Scratch__', true)
  if scratch == vim.api.nvim_get_current_buf() then
      return
  end

  -- Find the window to the right of the current one
  for _, win in ipairs(wins) do
    local win_pos = vim.fn.win_screenpos(win)
    local cur_pos = vim.fn.win_screenpos(current_win)
    if win_pos[2] > cur_pos[2] then
      right_win = win
      break
    end
  end

  if right_win then
    -- Focus the existing right window
    vim.api.nvim_set_current_win(right_win)
  elseif #wins == 1 then
    -- Create a new vertical split
    vim.cmd('vsplit')
  end

  vim.cmd('buffer ' .. scratch)
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'hide'
  vim.bo.swapfile = false
end

vim.api.nvim_create_user_command('Scratch', open_scratch_buffer, {})

local mygroup = vim.api.nvim_create_augroup("Matty", { clear = true })

-- disable spelling checks in the builtin terminal
vim.api.nvim_create_autocmd('TermOpen', {
    group = mygroup,
    callback = function()
        vim.opt_local.spell = false
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end,
})

