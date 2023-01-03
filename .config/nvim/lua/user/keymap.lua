-- Default keymap options
local opts = { noremap = false, silent = true };

-- Shorten the binding
local keymap = vim.keymap.set;

vim.g.mapleader = " ";
vim.g.maplocalleader = " ";
keymap("", "<leader>", "<Nop>", opts);

-- Normal [START]


keymap("n", "<leader>pv", vim.cmd.Ex, opts);
keymap("n", "<leader>f", vim.lsp.buf.format, opts);
keymap("n", "<C-d>", "<C-d>zz", opts);
keymap("n", "<C-u>", "<C-u>zz", opts);
keymap("n", "n", "Nzzzv", opts);
keymap("n", "N", "nzzzv", opts);
keymap("n", "J", "mzJ`z", opts);
keymap("n", "<leader>Y", [["+Y]], opts);
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts);
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts);
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts);
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts);
keymap("n", "Q", "<Nop>", opts);
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts);
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts);
-- TODO: Does not work
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)

-- Normal [END]




-- Visual [START]

keymap("v", "J", ":m '>+1<CR>gv=gv", opts);
keymap("v", "K", ":m '>-2<CR>gv=gv", opts);

-- Visual [END]




-- Insert [START]

keymap("i", "<C-c>", "<Esc>", opts);

-- Insert [END]




-- X [START]

keymap("x", "<leader>p", [["_dP]], opts);

-- X [END]




-- Combo [START]

keymap({ "n", "v" }, "<leader>y", [["+y]], opts);
keymap({ "n", "v" }, "<leader>d", [["_d]], opts);

-- Combo [END]
