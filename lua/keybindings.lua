-- All keybindings

-- Shorthand for binding key sequences to actions, defaulting to normal mode
local function bind(key_sequence, cmd, desc, mode)
    local _mode = mode or "n" -- default to normal mode
    vim.keymap.set(_mode, key_sequence, cmd, { desc = desc})
end


-- Shorthand for binding key sequences to Ex mode commands
local function bind_ex(key_sequence, cmd, desc, mode)
    bind(key_sequence, "<cmd>" .. cmd .. "<cr>", desc, mode)
end


-- Same as bind, adding a leader key prefix.
local function lbind(key_sequence, cmd, desc, mode)
    bind("<leader>" .. key_sequence, cmd, desc, mode)
end


-- Same as bind_ex, adding a leader prefix.
local function lbind_ex(key_sequence, cmd, desc, mode)
    bind_ex("<leader>" .. key_sequence, cmd, desc, mode)
end


-- common
lbind_ex("q", "q!", "quit/close")

-- code
lbind_ex("cc", "!make", "compile")

-- window
lbind("w", "<C-w>", "window actions")
lbind("wh", "<C-w>h", "left")
lbind("wl", "<C-w>l", "right")
lbind("wk", "<C-w>k", "up")
lbind("wj", "<C-w>j", "down")
lbind("wc", "<C-w>c", "close")

-- buffer
lbind_ex("bn", "bnext", "goto next")
lbind_ex("bp", "bprev", "goto previous")
lbind_ex("bd", "bd", "delete current")
lbind_ex("bD", "%bd", "delete all")

lbind_ex("ba", "ball", "open all")
lbind_ex("bb", "ls", "list buffers")
lbind_ex("bl", "ls", "list buffers")


---@type table
G.keybindings = {}

---@return nil
function G.keybindings.which_key()
    local wk = require("which-key")
    wk.register(
        -- mappings
        {
            -- prefix names
            b = { name = "buffer" },
            c = { name = "code" },
            f = { name = "files" },
            o = { name = "open" },
            s = { name = "search" },
            w = { name = "window" }
        },
        -- opts
        {
            prefix = "<leader>",
        })
end

---@return nil
function G.keybindings.telescope()
    local tsbi = require("telescope.builtin")

    -- file
    lbind("<leader>", tsbi.find_files, "find file")
    lbind("fl", tsbi.find_files, "list available")
    lbind("ff", tsbi.find_files, "find")

    -- buffer
    lbind("bb", tsbi.buffers, "list open buffers")
    lbind("bl", tsbi.buffers, "list open buffers")

    -- search
    lbind("ss", tsbi.live_grep, "search project")
    lbind("sg", tsbi.live_grep, "search project")

    vim.keymap.set("n", "<leader>fh", tsbi.help_tags, {})
end

---@return nil
function G.keybindings.lsp()
    local lspb = vim.lsp.buf;

    bind("K", lspb.hover, "hover")
    bind("<C-k>", lspb.signature_help, "signature help")

    bind("gd", lspb.definition, "goto definition")
    bind("gD", lspb.declaration, "goto declaration")
    bind("gi", lspb.implementation, "goto implementation")
    bind("gr", lspb.references, "references")

    lbind("cr", lspb.rename, "rename")
    lbind("ca", lspb.code_action, "code action")
    lbind_ex("ch", "ClangdSwitchSourceHeader", "switch source/header")
end

