local M = {}
vim.g.mapleader = " "

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

---- command keymapping:
vim.keymap.set("c", "<C-b>", "<Left>", { noremap = true })
vim.keymap.set("c", "<C-f>", "<Right>", { noremap = true })
vim.keymap.set("c", "<C-a>", "<Home>", { noremap = true })
vim.keymap.set("c", "<C-e>", "<End>", { noremap = true })
----insert mode keymapping:
-- map('i', 'jk', '<Esc>')
-- vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

----visual mode keymapping:
vim.keymap.set("v", "J", "j", { noremap = true, silent = true })
-- search selected string
vim.keymap.set("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true, silent = true })

----normal mode keymapping:

--unbind default keys:
vim.keymap.set("n", "J", "j", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "2<C-w>>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "2<C-w><", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "<C-w>-", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>+", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>w', ':w<Enter>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>q', ':q<Enter>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>*", ":noh<Enter>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ll", "g_", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>hh", "^", { noremap = true, silent = true })
-- moving one line down in text wrapping
vim.keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true, silent = true, expr = true })
vim.keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true, silent = true, expr = true })
--centering cursor when go to positions
vim.keymap.set("n", "n", "nzz", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true, silent = true })
vim.keymap.set("n", "*", "*zz", { noremap = true, silent = true })
vim.keymap.set("n", "#", "#zz", { noremap = true, silent = true })
vim.keymap.set("n", "g*", "g*zz", { noremap = true, silent = true })
vim.keymap.set("n", "g#", "g#zz", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bb", "<C-^>", { noremap = true, silent = true })

--keybindings for barbar:
--jumping and reordering of buffers
vim.keymap.set("n", "<leader>,", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>.", ":BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><", ":BufferMovePrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>>", ":BufferMoveNext<CR>", { noremap = true, silent = true })
-- Goto buffer in position
vim.keymap.set("n", "<leader>1", ":BufferGoto 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>2", ":BufferGoto 2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>3", ":BufferGoto 3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>4", ":BufferGoto 4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>5", ":BufferGoto 5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>6", ":BufferGoto 6<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>7", ":BufferGoto 7<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>8", ":BufferGoto 8<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>9", ":BufferLast<CR>", { noremap = true, silent = true })
-- Pin/unpin buffer
vim.keymap.set("n", "<leader>p", ":BufferPin<CR>", { noremap = true, silent = true })
-- Close buffer
vim.keymap.set("n", "<leader>cc", ":BufferClose<CR>", { noremap = true, silent = true })

-- --keybindings for telescope:
-- vim.keymap.set("n", "<leader>ff", function()
-- 	require("telescope.builtin").find_files()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fg", function()
-- 	require("telescope.builtin").live_grep()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fG", function()
-- 	require("telescope.builtin").grep_string()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fb", function()
-- 	require("telescope.builtin").buffers()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fd", function()
-- 	require("telescope.builtin").diagnostics({ bufnr = 0 })
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fh", function()
-- 	require("telescope.builtin").help_tags()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "gr", function()
-- 	require("telescope.builtin").lsp_references()
-- end, { noremap = true, silent = true })

--keybydings for snacks:

function M.snacks_keybindings()
    return {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    -- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    -- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    -- { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
end

-- session
-- vim.keymap.set("n", "<leader>fs", ":SearchSession<CR>", { noremap = true, silent = true })

--keybindings for symbols:
vim.keymap.set("n", "<C-s>", ":SymbolsOutline<CR>", { noremap = true, silent = true })

--keybindings for nvimtree:
vim.keymap.set("n", "<C-t>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>x', ':NvimTreeFocus<CR>')
vim.keymap.set("i", "<C-t>", "<ESC>:NvimTreeFocus<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-t>", "<ESC>:NvimTreeFocus<CR>", { noremap = true, silent = true })

-- cmp
vim.keymap.set("n", "tc", ":CmpToggle<CR>", { noremap = true, silent = true })

-- todo:
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { noremap = true, silent = true, desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { noremap = true, silent = true, desc = "Previous todo comment" })

-- snippets
function M.snippet()
	local ls = require("luasnip")
	vim.keymap.set({ "i", "s" }, "<C-j>", function()
		ls.jump(1)
	end, { noremap = true, silent = true })
	vim.keymap.set({ "i", "s" }, "<C-k>", function()
		ls.jump(-1)
	end, { noremap = true, silent = true })
end

-- gitsigns:
function M.gitsigns(bufnr)
	local gs = require("gitsigns")
	local opts = { noremap = true, silent = true, buffer = bufnr }

	local next_hunk = function()
		if vim.wo.diff then
			vim.cmd.normal({ "]c", bang = true })
		else
			gs.nav_hunk("next")
		end
	end

	local last_hunk = function()
		if vim.wo.diff then
			vim.cmd.normal({ "[c", bang = true })
		else
			gs.nav_hunk("prev")
		end
	end

	vim.keymap.set("n", "]c", next_hunk, opts)
	vim.keymap.set("n", "[c", last_hunk, opts)
	vim.keymap.set("n", "<leader>hs", gs.stage_hunk)
	vim.keymap.set("n", "<leader>hS", gs.stage_buffer)
	vim.keymap.set("n", "<leader>hR", gs.reset_buffer, opts)
	vim.keymap.set("n", "<leader>hr", gs.reset_hunk)
	vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
	vim.keymap.set("n", "<leader>hb", function()
		gs.blame_line({ full = true })
	end, opts)
	vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)
	-- vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, opts)
	vim.keymap.set("n", "<leader>td", gs.toggle_deleted, opts)
	vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, opts)
	vim.keymap.set("n", "<leader>ts", gs.toggle_signs, opts)
end

--lsp:
function M.lsp(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	-- vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	-- vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	-- vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "ga", function()
		vim.lsp.buf.code_action({ apply = true })
	end, opts)
	-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<space>l", vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "ti", ":InlayToggle<CR>", opts)
	if client.name == "clangd" then
		vim.keymap.set("n", "<leader>o<Tab>", ":call v:lua.bufferCopy(0)<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>oo", ":ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>oh", ":ClangdTypeHierarchy<CR>", { noremap = true, silent = true })
	end
	--     vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format({ async = true }) end, opts)
	-- end
	-- if client.name == 'cmake' then
	--     vim.keymap.set('n', '<space>fm', '<cmd>FormatWrite<cr>', opts)
	-- end
end

vim.keymap.set("n", "<space>fm", function()
	require("conform").format({ bufnr = 0 })
end, { noremap = true, silent = true })
--oil:
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- cmp
function M.cmp()
	local cmp = require("cmp")
	return {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
		-- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}
end

-- nvimtree
function M.nvimtree(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)
	-- custom mappings
	vim.keymap.set("n", "<C-t>", function()
		api.node.open.edit()
	end, opts("Ctrl-t"))
	vim.keymap.set("n", "d", function()
		api.fs.trash()
	end, opts("Trash"))
end

-- trouble
function M.trouble()
	return {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	}
end

return M
