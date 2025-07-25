--[[
--
--

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.o.clipboard = 'unnamed'
--   vim.g.clipboard = 'pbcopy'
-- end)
--

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.smartindent = true

vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- Keep signcolumn on by default
vim.o.signcolumn = 'no'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- vim.keymap.set('n', '<leader>')

-- vim.keymap.set('')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local ignore_registers = { '_', '+' }
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('ClipboardYank', { clear = true }),
  desc = 'Yank to clipboard',
  callback = function()
    if vim.tbl_contains(ignore_registers, vim.v.register) then
      return
    end
    if vim.v.operator ~= 'y' then
      return
    end

    local value = vim.fn.getreg(vim.v.register, 1)
    local type = vim.fn.getregtype(vim.v.register)
    vim.fn.setreg('+', value, type)
    vim.fn.setreg('p', value, type)
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`.
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'FabijanZulj/blame.nvim',
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
  },

  {
    'nvimtools/hydra.nvim',
    event = 'VeryLazy',
    config = function()
      local Hydra = require 'hydra'
      Hydra {
        name = 'Window Manager',
        mode = 'n',
        config = {
          invoke_on_body = true,
          hint = {
            type = 'window',
            float_opts = {
              border = 'rounded',
            },
          },
        },
        body = '<leader>w',
        heads = {
          { 'w', '<C-W>p', { desc = 'Switch to other window', exit = true } },

          { 'd', '<C-W>c', { desc = 'Close window' } },
          { 'v', '<Cmd>vnew<Cr>', { desc = 'Split window right' } },
          { 'h', '<Cmd>new<Cr>', { desc = 'Split window below' } },

          { '<S-Right>', '<Cmd>vnew<Cr>', { desc = 'Split window right' } },
          { '<S-Down>', '<Cmd>new<Cr>', { desc = 'Split window below' } },

          { 's', '<C-W>x', { desc = 'Swap window with next' } },

          { '=', '<C-W>=', { desc = 'Equalize windows' } },
          { '>', '10<C-w>>', { desc = 'resize →' } },
          { '<', '10<C-w><', { desc = 'resize ←' } },
          { '+', '10<C-w>+', { desc = 'resize ↑' } },
          { '-', '10<C-w>-', { desc = 'resize ↓' } },
          -- This is just an alias for `-` incase it gets mistyped (no S- modifier)
          { '_', '10<C-w>-', { desc = false } },

          { '<Left>', '<C-w>h', { desc = 'Go to left window' } },
          { '<Right>', '<C-w>l', { desc = 'Go to right window' } },
          { '<Up>', '<C-w>k', { desc = 'Go to upper window' } },
          { '<Down>', '<C-w>j', { desc = 'Go to lower window' } },

          { '<Esc>', nil, { desc = 'Exit', exit = true } },
          { 'q', nil, { desc = 'Exit', exit = true } },
        },
      }
    end,
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 500,
      styles = {},
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        --{ '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  --{ -- Fuzzy Finder (files, lsp, etc)
  --  'nvim-telescope/telescope.nvim',
  --  event = 'VimEnter',
  --  dependencies = {
  --    'nvim-lua/plenary.nvim',
  --    { -- If encountering errors, see telescope-fzf-native README for installation instructions
  --      'nvim-telescope/telescope-fzf-native.nvim',

  --      -- `build` is used to run some command when the plugin is installed/updated.
  --      -- This is only run then, not every time Neovim starts up.
  --      build = 'make',

  --      -- `cond` is a condition used to determine whether this plugin should be
  --      -- installed and loaded.
  --      cond = function()
  --        return vim.fn.executable 'make' == 1
  --      end,
  --    },
  --    { 'nvim-telescope/telescope-ui-select.nvim' },

  --    -- Useful for getting pretty icons, but requires a Nerd Font.
  --    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  --  },
  --  config = function()
  --    require('telescope').setup {
  --      pickers = {
  --        find_files = {
  --          hidden = true,
  --        },
  --      },
	--			layout_config = {
	--				vertical = { width = 0.5 }
	--			},
  --      extensions = {
  --        ['ui-select'] = {
  --          require('telescope.themes').get_dropdown(),
  --        },
  --      },
  --    }

  --    -- Enable Telescope extensions if they are installed
  --    pcall(require('telescope').load_extension, 'fzf')
  --    pcall(require('telescope').load_extension, 'ui-select')

  --    -- See `:help telescope.builtin`
  --    local builtin = require 'telescope.builtin'
  --    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  --    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  --    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
  --    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  --    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  --    --vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  --    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  --    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  --    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

  --    --local findfiles = function()
  --    --  builtin.find_files { hidden = true, no_ignore = true }
  --    --end
  --    --vim.keymap.set('n', '<c-p>', findfiles, { desc = '[S]earch [F]iles' })

  --    local vsplitscope = function()
  --      vim.cmd 'vs'
  --    end

  --    vim.keymap.set('n', '<C-.>', vsplitscope)
  --    vim.keymap.set('n', '<C-,>', '<Esc><Cmd>ConjureLogVSplit<CR>')

  --    -- vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')

  --    -- Slightly advanced example of overriding default behavior and theme
  --    vim.keymap.set('n', '<leader>/', function()
  --      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  --      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  --        winblend = 10,
  --        previewer = false,
  --      })
  --    end, { desc = '[/] Fuzzily search in current buffer' })

	--		--vim.keymap.set('n', '<leader>sg', function()
	--		--	local fzf = require('fzf-lua')
	--		--end)

  --    -- It's also possible to pass additional configuration options.
  --    --  See `:help telescope.builtin.live_grep()` for information about particular keys
  --    vim.keymap.set('n', '<leader>s/', function()
  --      builtin.live_grep {
  --        grep_open_files = true,
  --        prompt_title = 'Live Grep in Open Files',
  --      }
  --    end, { desc = '[S]earch [/] in Open Files' })

  --    -- Shortcut for searching your Neovim configuration files
  --    vim.keymap.set('n', '<leader>sn', function()
  --      builtin.find_files { cwd = vim.fn.stdpath 'config' }
  --    end, { desc = '[S]earch [N]eovim files' })
  --  end,
  --},

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- Find references for the word under your cursor.
          --map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          --map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          --map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          --map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          --map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          --map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          --map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --
        clojure_lsp = {
          filetype_overrides = { 'clj', 'bb' },
        },
        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  --{ -- Autoformat
  --  'stevearc/conform.nvim',
  --  event = { 'BufWritePre' },
  --  cmd = { 'ConformInfo' },
  --  keys = {
  --    {
  --      '<leader>f',
  --      function()
  --        require('conform').format { async = true, lsp_format = 'fallback' }
  --      end,
  --      mode = '',
  --      desc = '[F]ormat buffer',
  --    },
  --  },
  --  opts = {
  --    notify_on_error = false,
  --    format_on_save = function(bufnr)
  --      -- Disable "format_on_save lsp_fallback" for languages that don't
  --      -- have a well standardized coding style. You can add additional
  --      -- languages here or re-enable it for the disabled ones.
  --      local disable_filetypes = { c = true, cpp = true }
  --      if disable_filetypes[vim.bo[bufnr].filetype] then
  --        return nil
  --      else
  --        return {
  --          timeout_ms = 500,
  --          lsp_format = 'fallback',
  --        }
  --      end
  --    end,
  --    formatters_by_ft = {
  --      lua = { 'stylua' },
  --      -- Conform can also run multiple formatters sequentially
  --      -- python = { "isort", "black" },
  --      --
  --      -- You can use 'stop_after_first' to run the first available formatter from the list
  --      -- javascript = { "prettierd", "prettier", stop_after_first = true },
  --    },
  --  },
  --},

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },

  {
    'mason-org/mason.nvim',
  },

  {
    'hrsh7th/nvim-cmp',
  },

  {
    'psliwka/vim-smoothie',
    event = 'VeryLazy',
    init = function()
      vim.g['smoothie_remapped_commands'] = { '<C-D>', '<C-U>', 'gg', 'G', 'n', 'N', 'j', 'k' }
    end,
  },

  --  {
  --    'olivercederborg/poimandres.nvim',
  --    lazy = false,
  --    priority = 1000,
  --    config = function()
  --      require('poimandres').setup {
  --        -- leave this setup function empty
  --        -- for default config.
  --      }
  --    end,
  --
  --    -- optionally set the colorscheme within lazy config
  --    init = function()
  --      vim.cmd 'colorscheme poimandres'
  --    end,
  --  },

  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true },

  {
    'Olical/conjure',
    init = function()
      vim.g['conjure#extract#tree_sitter#enabled'] = true

      vim.g['conjure#client#clojure#nrepl#eval#raw_out'] = true
      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#enabled'] = false
      vim.g['conjure#log#wrap'] = true
      vim.g['conjure#client#clojure#nrepl#eval#auto_require'] = true

      -- vim.g['conjure#mapping#doc_word'] = false
      -- vim.g['conjure#mapping#log_jump_to_latest'] = false
    end,
  },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  {
    'julienvincent/nvim-paredit',
    config = function()
      local paredit = require 'nvim-paredit'

      paredit.setup {
        keys = {
          --['<C-[>'] = { paredit.api_barf_forwards, 'barf forwards' },
          --['<C-]>'] = { paredit.api.slurp_forwards, 'slurp forwards' },
        },
      }
    end,
  },

  
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        lualine_a = {
          {
            'mode',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 0 },
          },
        },
        lualine_b = {
          { 'branch' },
        },
        lualine_c = {
          { '%=', padding = 0 },
          {
            'datetime',
            style = '%H:%M ',
            separator = { left = '', right = '' },
            padding = 0,
            color = function()
              local mode = require('local.theme').get_mode()

              return 'lualine_a_' .. mode
            end,
          },
        },
        lualine_x = {},
        lualine_y = {
          {
            'filetype',
            fmt = function(name)
              return string.upper(name)
            end,
          },
        },
        lualine_z = {
          {
            function()
              local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))
              local max_lnum = vim.api.nvim_buf_line_count(0)

              local ruler
              if lnum == 1 then
                ruler = 'TOP'
              elseif lnum == max_lnum then
                ruler = 'BOT'
              else
                ruler = string.format('%2d%%%%', math.floor(100 * lnum / max_lnum))
              end

              return string.format('%' .. string.len(vim.bo.textwidth) .. 'd %s', col + 1, ruler)
            end,
            separator = { left = '', right = '' },
            padding = { left = 0, right = 1 },
          },
        },
      }
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local Rule = require 'nvim-autopairs.rule'
      local pairs = require 'nvim-autopairs'

      pairs.setup {
        check_ts = true,
        enable_check_bracket_line = false,
      }

      pairs.get_rules('`')[1].not_filetypes = { 'clojure' }
      pairs.get_rules("'")[1].not_filetypes = { 'clojure', 'rust' }
    end,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  {
    'xiyaowong/transparent.nvim',
    config = function()
      local trans = require 'transparent'
      trans.clear_prefix 'NeoTree'
      trans.clear_prefix 'Telescope'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  --{
  --  'petertriho/nvim-scrollbar',
  --  event = 'BufReadPost',
  --  enabled = true,
  --  config = function()
  --    require('scrollbar').setup {
  --      handle = {
  --        blend = 0,
  --      },
  --      marks = {
  --        Cursor = {
  --          text = '',
  --        },
  --      },
  --      handlers = {
  --        gitsigns = true,
  --      },
  --      hide_if_all_visible = true,
  --      excluded_buftypes = {
  --        'nofile',
  --      },
  --      excluded_filetypes = {
  --        'cmp_docs',
  --        'cmp_menu',
  --        'noice',
  --        'prompt',
  --        'neo-tree',
  --        'neo-tree-popup',
  --        'DiffviewFiles',
  --      },
  --    }
  --  end,
  --},
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context' },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    -- default configuration
    {
      'CRAG666/betterTerm.nvim',
      event = 'VeryLazy',
      opts = {
        position = 'bot',
        size = 20,
      },
      keys = {
        {
          mode = { 'n', 't' },
          '<C-;>',
          function()
            require('betterTerm').open()
          end,
        },
        {
          mode = { 'n', 't' },
          '<leader>1',
          function()
            require('betterTerm').open(0)
          end,
        },
        {
          mode = { 'n', 't' },
          '<leader>2',
          function()
            require('betterTerm').open(1)
          end,
        },
        {
          mode = { 'n', 't' },
          '<leader>3',
          function()
            require('betterTerm').open(2)
          end,
        },
      },
    },
    {
      'RRethy/vim-illuminate',
      config = function()
        require('illuminate').configure {
          -- providers: provider used to get references in the buffer, ordered by priority
          providers = {
            'lsp',
            'treesitter',
            'regex',
          },
          -- delay: delay in milliseconds
          delay = 100,
          -- filetype_overrides: filetype specific overrides.
          -- The keys are strings to represent the filetype while the values are tables that
          -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
          filetype_overrides = {},
          -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
          filetypes_denylist = {
            'dirbuf',
            'dirvish',
            'fugitive',
          },
          -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
          -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
          filetypes_allowlist = {},
          -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
          -- See `:help mode()` for possible values
          modes_denylist = {},
          -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
          -- See `:help mode()` for possible values
          modes_allowlist = {},
          -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
          -- Only applies to the 'regex' provider
          -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
          providers_regex_syntax_denylist = {},
          -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
          -- Only applies to the 'regex' provider
          -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
          providers_regex_syntax_allowlist = {},
          -- under_cursor: whether or not to illuminate under the cursor
          under_cursor = true,
          -- large_file_cutoff: number of lines at which to use large_file_config
          -- The `under_cursor` option is disabled when this cutoff is hit
          large_file_cutoff = 10000,
          -- large_file_config: config to use for large files (based on large_file_cutoff).
          -- Supports the same keys passed to .configure
          -- If nil, vim-illuminate will be disabled for large files.
          large_file_overrides = nil,
          -- min_count_to_highlight: minimum number of matches required to perform highlighting
          min_count_to_highlight = 1,
          -- should_enable: a callback that overrides all other settings to
          -- enable/disable illumination. This will be called a lot so don't do
          -- anything expensive in it.
          should_enable = function(bufnr)
            return true
          end,
          -- case_insensitive_regex: sets regex case sensitivity
          case_insensitive_regex = false,
          -- disable_keymaps: disable default keymaps
          disable_keymaps = false,
        }
      end,
    },
  },
	{
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({
        winopts = {
          preview = {
            layout = "vertical",
            delay = 0,
            vertical = "up:60%",
          },
        },

        fzf_opts = {
          ["--cycle"] = true,
          ["--pointer"] = "❯",
          ["--marker"] = "❯",
          ["--layout"] = "default",
        },

        fzf_colors = {
          ["gutter"] = "-1",
        },

        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
            ["alt-a"] = "toggle",
            ["alt-A"] = "toggle-all",
          },
        },
      })

      vim.keymap.set("n", "<C-p>", function()
        fzf.files({
          prompt = "❯ ",
          header = false,
          cwd_prompt = false,
          ignore_current_file = true,

          winopts = {
            height = 0.70,
            width = 0.70,
            row = 0.33,
            col = 0.33,
          },
        })
      end, { silent = true, desc = "Find files" })

      vim.keymap.set("n", "<leader>sg", function()
        fzf.live_grep({
          keymap = {
            fzf = {
              ["ctrl-q"] = "select-all+accept",
              ["alt-a"] = "toggle",
            },
          },
        })
      end, { silent = true, desc = "Find" })

      vim.keymap.set("n", "<leader>ffff", function()
        fzf.grep_project({ resume = true })
      end, { silent = true, desc = "Find" })

      vim.keymap.set("n", "<leader>/", function()
        fzf.grep_curbuf()
      end, { silent = true, desc = "Find" })
    end,
  },

	{
		'nvim-tree/nvim-tree.lua',
		config = function()
			require('nvim-tree').setup()
		end
	},

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {

  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
--
--
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight Normal guifg=none
	highlight Keyword ctermbg=none guibg=none
	highlight String ctermbg=none guibg=none
	highlight LspReferenceText ctermbg=none guibg=none
	highlight IlluminatedWordText ctermbg=none  guibg=none

	highlight LspReferenceRead ctermbg=none guibg=none
	highlight IlluminatedWordRead ctermbg=none guibg=none

	highlight LspReferenceWrite ctermbg=none guibg=none
	highlight IlluminatedWordRead ctermbg=none guibg=none

	highlight WhichKeyNormal guibg=#0f1920 ctermbg=none
	highlight BlinkCmpMenu guibg=#0f1920 ctermbg=none

	colorscheme randomhue

]]

vim.keymap.set('n', '<C-c><C-c>', '<Esc><Cmd>ConjureCljConnectPortFile<CR>')
vim.keymap.set('n', '<C-c><C-d>', '<Esc><Cmd>ConjureCljDisconnect<CR>')

vim.keymap.set('t', '<Esc>', '<Esc>', opts)
-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

vim.keymap.set('n', '<C-b>', function()
	vim.cmd[[
	NvimTreeToggle
	]]
end)

--vim.keymap.set('n', '<C-b>', function()
--  local manager = require 'neo-tree.sources.manager'
--  local renderer = require 'neo-tree.ui.renderer'
--
--  local state = manager.get_state 'filesystem'
--  local window_exists = renderer.window_exists(state)
--
--  if window_exists then
--    vim.cmd 'Neotree close'
--  else
--    vim.cmd 'Neotree show'
--  end
--end)

--
--
