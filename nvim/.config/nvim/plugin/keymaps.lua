local map = vim.keymap.set

local opt_defaults = { silent = true, noremap = true }

local function nmap(keymap, command, opts)
    opts = opts or opt_defaults
    map('n', keymap, command, opts)
end

nmap('<c-j>', ':bn <cr>')
nmap('<c-k>', ':bp <cr>')

nmap('<leader>w', ':bp<cr>:bd #<cr>')
nmap('<leader>-', ':Oil<cr>')

nmap('<leader>cr', vim.lsp.buf.rename)
nmap('<leader>ca', vim.lsp.buf.code_action)
nmap('<leader>ci', vim.lsp.buf.implementation)

nmap('<leader>gs', ':Git<cr>')
nmap('<leader>gp', ':Git pull<cr>')
nmap('<leader>gf', ':Git fetch --all --prune --jobs=10<cr>')

nmap("<leader>//", function()
    vim.api.nvim_feedkeys(':%s/', 'n', false)
end)

-- Telescope
local fzf = require('fzf-lua')
nmap('<leader>fr', fzf.resume)
nmap('<leader>ff', fzf.files)
nmap('<leader>fs', ':FzfLua live_grep winopts.preview.hidden=false<cr>')
nmap('<leader>fb', fzf.buffers)
nmap('<leader>fu', fzf.lsp_references)
nmap('<leader>gc', fzf.git_commits)
nmap('<leader>gb', fzf.git_branches)
nmap('<leader>ca', fzf.lsp_code_actions)
nmap('<leader>cv', ':FzfLua files cwd=$HOME/.config/nvim<cr>')

nmap('<leader>ch', fzf.command_history)

nmap('<leader>zz', ':FzfLua<cr>')
map('t', '<esc><esc>', "<c-\\><c-n>") -- use esc to return to normal mode when in terminal mode
