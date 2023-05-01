local map = vim.keymap.set

local opts = { silent = true, noremap = true }

map('n', '<c-n>', ':bn <cr>')
map('n', '<c-p>', ':bp <cr>')

map('n', '<C-j>', [[<Cmd>wincmd w<CR>]], opts)
map('n', '<C-k>', [[<Cmd>wincmd W<CR>]], opts)

map('n', '<leader>w', ':bp<cr>:bd #<cr>')
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>ee', ':Explore<cr>')
map('n', '<leader>ec', ':Explore $HOME/code<cr>')
map('n', '<leader>1', ':only<cr>')
map('n', '<leader>cv', ':Telescope find_files follow=true cwd=$HOME/.config/nvim<cr>')
map('n', '<leader>cf', ':Telescope find_files follow=true cwd=$HOME/.config/fish<cr>')

map('n', '<leader>gg', ':Git')
map('n', '<leader>gs', ':Git<cr>')
map('n', '<leader>gp', ':Git push<cr>')
map('n', '<leader>gf', ':Git fetch --all --prune --jobs=10<cr>')

map("n", "<leader>u", vim.cmd.UndotreeToggle)

map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)

map("n", "<leader><leader>", "<cmd>so<cr>")

-- Telescope
local tele = require('telescope.builtin')
map('n', '<leader>tt', '<cmd>Telescope <cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files follow=true theme=dropdown<cr>')
map('n', '<leader>fF', '<cmd>Telescope find_files follow=true hidden=true theme=dropdown<cr>')
map('n', '<leader>fg', tele.live_grep)
map('n', '<leader>fb', tele.buffers)
map('n', '<leader>fo', tele.lsp_document_symbols)
map('n', '<leader>fw', tele.lsp_workspace_symbols)
map('n', '<leader>fh', tele.help_tags)
map('n', '<leader>gc', tele.git_commits)
map('n', '<leader>gb', tele.git_branches)
map('n', '<leader>ts', tele.treesitter)

map('n', '<leader>rr', tele.command_history)
map('n', '<leader>cc', tele.commands)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  map('t', '<esc>', [[<C-\><C-n>]], opts)
  map('t', 'jk', [[<C-\><C-n>]], opts)
  map('t', '<C-j>', [[<Cmd>wincmd w<CR>]], opts)
  map('t', '<C-h>', [[<Cmd>wincmd W<CR>]], opts)
end

map('n', '<leader>fr', ':term ./%')

