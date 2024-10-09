local map = vim.keymap.set

local opt_defaults = { silent = true, noremap = true }

local function nmap(keymap, command, opts)
    opts = opts or opt_defaults
    map('n', keymap, command, opts)
end

nmap('<c-n>', ':bn <cr>')
nmap('<c-p>', ':bp <cr>')

nmap('<C-j>', '<Cmd>wincmd w<CR>')
nmap('<C-k>', '<Cmd>wincmd W<CR>')

nmap('<leader>w', ':bp<cr>:bd #<cr>')
nmap('<leader>q', ':bunload<cr>')
nmap('<leader>-', ':Oil<cr>')
nmap('<leader>1', ':only<cr>')
nmap('<leader>cv', ':Telescope find_files follow=true cwd=$HOME/.config/nvim<cr>')
nmap('<leader>cf', ':Telescope find_files follow=true cwd=$HOME/.config/fish<cr>')

nmap('<leader>cr', vim.lsp.buf.rename)
nmap('<leader>ca', vim.lsp.buf.code_action)
nmap('<leader>ci', vim.lsp.buf.implementation)

nmap('<leader>gs', ':Git<cr>')
nmap('<leader>gp', ':Git pull<cr>')
nmap('<leader>gf', ':Git fetch --all --prune --jobs=10<cr>')

nmap("<leader>u", vim.cmd.UndotreeToggle)
nmap("<leader>//", ':%s/')

-- Telescope
local tele = require('telescope.builtin')
nmap('<leader>tt', '<cmd>Telescope<cr>')
nmap('<leader>fr', '<cmd>Telescope resume<cr>')
nmap('<leader>ff', '<cmd>Telescope find_files follow=true <cr>')
nmap('<leader>fF', '<cmd>Telescope find_files follow=true hidden=true <cr>')
nmap('<leader>fs', tele.live_grep)
nmap('<leader>fb', tele.buffers)
nmap('<leader>fo', tele.lsp_document_symbols)
nmap('<leader>fw', tele.lsp_workspace_symbols)
nmap('<leader>fh', tele.help_tags)
nmap('<leader>fg', tele.git_files)
nmap('<leader>gc', tele.git_commits)
nmap('<leader>gb', tele.git_branches)

nmap('<leader>rr', tele.command_history)
nmap("<leader><leader>c", tele.commands)

local t_opts = {buffer = 0, silent = true}
map('t', '<esc>', [[<C-\><C-n>]], t_opts)
map('t', 'jk', [[<C-\><C-n>]], t_opts)
map('t', '<C-j>', [[<Cmd>wincmd w<CR>]], t_opts)
map('t', '<C-h>', [[<Cmd>wincmd W<CR>]], t_opts)
