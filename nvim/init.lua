vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.fillchars = { vert = "│", eob = " " }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end

vim.lsp.log.set_level("ERROR")

vim.opt.rtp:prepend(lazypath)

vim.api.nvim_set_hl(0, "@keyword", { fg = "#94B2A6", bold = true })
vim.api.nvim_set_hl(0, "@function", { fg = "#6D344F", bold = true })
vim.api.nvim_set_hl(0, "@variable", { fg = "#99324E", bold = true })
vim.api.nvim_set_hl(0, "@property", { fg = "#01455E", bold = true })

require("lazy").setup({
	{
    "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "html",
                    "css",
                    "lua",
                    "vim",
                    "kotlin",
                    "java",
                    "rust",
                    "typescript",
                    "javascript",
                    "tsx",
                    "c",
                    "cpp",
                    "python",
                    "json",
                    "bash",
                },
                highlight = { enable = true },
            })
        end
    },
    { "nvim-telescope/telescope.nvim",dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim"
    },
    { "neovim/nvim-lspconfig" },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("neo-tree").setup({})
        end
    },
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        opts = {
            keymap = {
                preset = "super-tab"
            },
            appearance = { nerd_font_variant = "mono" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" }
            }
        }
    },
    {
      "windwp/nvim-ts-autotag",
      opts = {},
    }
})

require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
        hijack_netrw_behavior = "disabled",
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false
        },
        find_command = "fd",
        find_args = {
            "--hidden",
            -- "--no-ignore",
            "--exclude", ".git",
        },
    },
    default_component_configs = {
        indent = { with_expanders = true }
    }
})

require("telescope").setup({
  pickers = {
    find_files = {
      hidden = true,       -- show dotfiles
      no_ignore = false,    -- show gitignored files
      file_ignore_patterns = { "^.git/" },
    },
    live_grep = {
      additional_args = { "--hidden", "--glob", "!.git/" },
    },
  },
})

automatic_enable = false
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "kotlin_lsp",
        "jdtls",
        "rust_analyzer",
        "ts_ls",
        "html",
        "cssls",
        "clangd",
        "pyright",
    },
})

vim.lsp.config("kotlin_lsp", {
    single_file_support = false,
})
vim.lsp.config("jdtls", {})
vim.lsp.config("rust_analyzer", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("pyright", {})
vim.lsp.enable({
    "kotlin_lsp",
    "jdtls",
    "rust_analyzer",
    "ts_ls",
    "html",
    "cssls",
    "clangd",
    "pyright",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

-- key configs

vim.api.nvim_create_user_command("Kt", function(opts)
    local module, rest = opts.args:match("^([^/]+)/(.+)$")
    if not module then
        vim.notify("Usage: :Kt <module>/<path/tp/File.kt>", vim.log.levels.ERROR)
        return
    end

    local path = module .. "/src/main/kotlin/com/cameronsh/" .. module .. "/" .. rest

    vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
    vim.cmd("edit " .. vim.fn.fnameescape(path))
end, { nargs = 1 })

-- Bindings

vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>n", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", ":bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>d", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus file tree" })
