local map = vim.keymap.set

map('n', '<c-n>', ':bn <cr>')
map('n', '<c-p>', ':bp <cr>')

map('n', '<C-j>', [[<Cmd>wincmd w<CR>]], opts)
map('n', '<C-k>', [[<Cmd>wincmd W<CR>]], opts)

map('n', '<leader>w', ':bp<cr>:bd #<cr>')
map('n', '<leader>ee', ':Explore<cr>')
map('n', '<leader>ec', ':Explore $HOME/code<cr>')
map('n', '<leader>1', ':only<cr>')
map('n', '<leader>cv', ':Telescope find_files follow=true cwd=$HOME/.dotfiles/config/nvim<cr>')
map('n', '<leader>cf', ':Telescope find_files follow=true cwd=$HOME/.dotfiles/config/fish<cr>')

map('n', '<leader>rt', ':split term://lua missions.lua<cr>i')

-- Telescope
local tele = require('telescope.builtin')
map('n', '<leader>ff', ':Telescope find_files follow=true <cr>')
map('n', '<leader>fF', ':Telescope find_files follow=true hidden=true<cr>')
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
  map('t', '<esc>', [[<C-\><C-n>]], opts)
  map('t', 'jk', [[<C-\><C-n>]], opts)
  map('t', '<C-j>', [[<Cmd>wincmd w<CR>]], opts)
  map('t', '<C-h>', [[<Cmd>wincmd W<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

map('n', '<leader>tt', ':ToggleTerm<cr>')

