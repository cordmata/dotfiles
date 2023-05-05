local map = vim.keymap.set

local opt_defaults = { silent = true, noremap = true }

local function nmap(keymap, command, opts)
    opts = opts or opt_defaults
    map('n', keymap, command, opts)
end

nmap('<c-n>', ':bn <cr>')
nmap('<c-p>', ':bp <cr>')

nmap('<C-j>', [[<Cmd>wincmd w<CR>]])
nmap('<C-k>', [[<Cmd>wincmd W<CR>]])

nmap('<leader>w', ':bp<cr>:bd #<cr>')
nmap('<leader>q', ':q<cr>')
nmap('<leader>ee', ':Lexplore<cr>')
nmap('<leader>1', ':only<cr>')
nmap('<leader>cv', ':Telescope find_files follow=true cwd=$HOME/.config/nvim<cr>')
nmap('<leader>cf', ':Telescope find_files follow=true cwd=$HOME/.config/fish<cr>')

nmap('<leader>gg', ':Git')
nmap('<leader>gs', ':Git<cr>')
nmap('<leader>gp', ':Git push<cr>')
nmap('<leader>gf', ':Git fetch --all --prune --jobs=10<cr>')

map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>//", ':%s/')

map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")

map("n", "<leader><leader>", "<cmd>so<cr>")

-- Telescope
local tele = require('telescope.builtin')
nmap('<leader>tt', '<cmd>Telescope<cr>')
nmap('<leader>ff', '<cmd>Telescope find_files follow=true <cr>')
nmap('<leader>fF', '<cmd>Telescope find_files follow=true hidden=true <cr>')
nmap('<leader>fg', tele.live_grep)
nmap('<leader>fb', tele.buffers)
nmap('<leader>fo', tele.lsp_document_symbols)
nmap('<leader>fw', tele.lsp_workspace_symbols)
nmap('<leader>fh', tele.help_tags)
nmap('<leader>gc', tele.git_commits)
nmap('<leader>gb', tele.git_branches)
nmap('<leader>ts', tele.treesitter)

nmap('<leader>rr', tele.command_history)
nmap("<leader><leader>c", tele.commands)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  map('t', '<esc>', [[<C-\><C-n>]])
  map('t', 'jk', [[<C-\><C-n>]])
  map('t', '<C-j>', [[<Cmd>wincmd w<CR>]])
  map('t', '<C-h>', [[<Cmd>wincmd W<CR>]])
end

nmap('<leader>fr', ':term ./%')

