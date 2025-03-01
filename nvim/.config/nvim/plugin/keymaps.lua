local fzf = require('fzf-lua')
local map = vim.keymap.set

local opt_defaults = { silent = true, noremap = true }

local function nmap(keymap, command, opts)
    opts = opts or opt_defaults
    map('n', keymap, command, opts)
end

-- buffer navigation
nmap('<c-j>', ':bn <cr>')
nmap('<c-k>', ':bp <cr>')
nmap('<c-c>', ':bd <cr>')

-- filesystem browse
nmap('<leader>-', ':Oil<cr>')

-- quick search/replace
nmap("<leader>//", function()
    vim.api.nvim_feedkeys(':%s/', 'n', false)
end)

-- git
nmap('<leader>gs', ':Git<cr>')
nmap('<leader>gp', ':Git pull<cr>')
nmap('<leader>gf', ':Git fetch --all --prune --jobs=10<cr>')
nmap('<leader>gc', fzf.git_commits)
nmap('<leader>gb', fzf.git_branches)

-- common fuzzy-finders
nmap('<leader>fr', fzf.resume)
nmap('<leader>ff', fzf.files)
nmap('<leader>fs', ':FzfLua live_grep winopts.preview.hidden=false<cr>')
nmap('<leader>fb', fzf.buffers)
nmap('<leader>fu', fzf.lsp_references)

-- manage scratch buffer
nmap('<leader>bs', function ()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    local scratch = vim.fn.bufnr('__Scratch__', true)
    if scratch == vim.api.nvim_get_current_buf() and #wins > 1 then
        vim.cmd('quit')
    else
        if #wins > 1 then
            vim.cmd('only')
        end
        vim.cmd('vsplit')
        vim.cmd('buffer ' .. scratch)
        vim.bo.buftype = 'nofile'
        vim.bo.bufhidden = 'hide'
        vim.bo.swapfile = false
    end
end)

-- code and configuration
nmap('<leader>ca', fzf.lsp_code_actions)
nmap('<leader>ch', fzf.command_history)
nmap('<leader>cr', vim.lsp.buf.rename)
nmap('<leader>cv', ':FzfLua files cwd=$HOME/.config/nvim<cr>')
nmap('<leader>cf', ':FzfLua files cwd=$HOME/.config/fish<cr>')

-- diagnostics
nmap('<leader>dd', vim.diagnostic.open_float)
nmap('<leader>ds', vim.diagnostic.show)
nmap('<leader>dh', vim.diagnostic.hide)

-- json format
nmap('<leader>jf', ':%!jq .<cr>')

-- project switcher
nmap('<leader>p', function()
    fzf.zoxide({
        actions = {
            enter = function(args)
                fzf.actions.cd(args, {})
                vim.cmd("Oil .")
            end
        }
    })
end)

-- enable/disable inline spell checking
nmap('<leader>ss', ':set invspell<cr>')

-- list all fuzzy-find tools available
nmap('<leader>zz', ':FzfLua<cr>')

-- use esc to return to normal mode when in terminal mode
map('t', '<esc><esc>', "<c-\\><c-n>")
