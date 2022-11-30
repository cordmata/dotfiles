local map = vim.keymap.set
map('n', '<c-j>', ':bn <cr>')
map('n', '<c-k>', ':bp <cr>')

map('n', '<leader>w', ':bp<cr>:bd #<cr>')
map('n', '<leader>ee', ':Explore<cr>')
map('n', '<leader>ec', ':Explore $HOME/code<cr>')
map('n', '<leader>1', ':only<cr>')
map('n', '<leader>cv', ':Telescope find_files cwd=$HOME/.dotfiles/config/nvim<cr>')
map('n', '<leader>cf', ':Telescope find_files cwd=$HOME/.dotfiles/config/fish<cr>')

map('n', '<leader>rt', ':split term://lua missions.lua<cr>i')

-- Telescope
local tele = require('telescope.builtin')
map('n', '<leader>ff', tele.find_files)
map('n', '<leader>fF', ':Telescope find_files hidden=true<cr>')
map('n', '<leader>fr', ':Telescope lsp_references<cr>')
map('n', '<leader>fg', tele.live_grep)
map('n', '<leader>fb', tele.buffers)
map('n', '<leader>fo', tele.lsp_document_symbols)
map('n', '<leader>fw', tele.lsp_workspace_symbols)
map('n', '<leader>fh', tele.help_tags)
map('n', '<leader>gc', tele.git_commits)
map('n', '<leader>gb', tele.git_branches)
map('n', '<leader>ts', tele.treesitter)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

map('n', '<leader>tt', ':ToggleTerm<cr>')

