--theme:

require('onedark').setup {
    transparent = true,
    diagnostics = {
        undercurl = true
    },
    code_style = {
        comments = 'italic',
        keywords = 'italic,bold',
        functions = 'italic',
        strings = 'none',
        variables = 'none',
        conditionals = "italic",
    },
}

require('onedark').load()

-- require("onedarkpro").setup({
--     styles = {
--         types = "NONE",
--         methods = "NONE",
--         numbers = "NONE",
--         strings = "NONE",
--         comments = "italic",
--         keywords = "bold,italic",
--         constants = "NONE",
--         functions = "italic",
--         operators = "NONE",
--         variables = "NONE",
--         parameters = "NONE",
--         conditionals = "italic",
--         virtual_text = "NONE",
--     },
--     options = {
--         cursorline = true,
--         transparency = true,
--         window_unfocused_color = true,
--     },
--     plugins = {
--         all = true,
--     },
--     highlights = {
--         CursorLineNrNC = { bg = "${color_column}", fg = "${gray}" },
--         SignColumnNC = { bg = "${color_column}", fg = "${gray}" },
--         LineNrNC = { bg = "${color_column}", fg = "${gray}" },
--         TelescopeNormal = { bg = "${bg}", fg = "${fg}" },
--         TelescopeBorder = { bg = "${bg}", fg = "${gray}" },
--     },
-- })

-- require("catppuccin").setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = {
--         -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = true,
--     show_end_of_buffer = false, -- show the '~' characters after the end of buffers
--     term_colors = false,
--     dim_inactive = {
--         enabled = false,
--         shade = "dark",
--         percentage = 0.15,
--     },
--     no_italic = false, -- Force no italic
--     no_bold = false,   -- Force no bold
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = {},
--         functions = { "italic" },
--         keywords = { "bold", "italic" },
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         notify = false,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })
-- require('material').setup({

--     contrast = {
--         terminal = false, -- Enable contrast for the built-in terminal
--         sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
--         floating_windows = false, -- Enable contrast for floating windows
--         cursor_line = false, -- Enable darker background for the cursor line
--         non_current_windows = false, -- Enable darker background for non-current windows
--         filetypes = {"cpp"}, -- Specify which filetypes get the contrasted (darker) background
--     },

--     styles = { -- Give comments style such as bold, italic, underline etc.
--         comments = { italic = true },
--         strings = { --[[ bold = true ]] },
--         keywords = { italic = true, bold = true },
--         functions = { italic = true },
--         variables = {},
--         operators = {},
--         types = {},
--     },

--     plugins = { -- Uncomment the plugins that you use to highlight them
--         -- Available plugins:
--         -- "dap",
--         -- "dashboard",
--         "gitsigns",
--         -- "hop",
--         -- "indent-blankline",
--         -- "lspsaga",
--         -- "mini",
--         -- "neogit",
--         -- "neorg",
--         "nvim-cmp",
--         -- "nvim-navic",
--         "nvim-tree",
--         "nvim-web-devicons",
--         -- "sneak",
--         "telescope",
--         "trouble",
--         -- "which-key",
--     },

--     disable = {
--         colored_cursor = false, -- Disable the colored cursor
--         borders = false, -- Disable borders between verticaly split windows
--         background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--         term_colors = false, -- Prevent the theme from setting terminal colors
--         eob_lines = false -- Hide the end-of-buffer lines
--     },

--     high_visibility = {
--         lighter = false, -- Enable higher contrast text for lighter style
--         darker = true -- Enable higher contrast text for darker style
--     },

--     lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

--     async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

--     custom_colors = nil, -- If you want to everride the default colors, set this to a function

--     custom_highlights = {}, -- Overwrite highlights with your own
-- })
-- vim.cmd.colorscheme "onedark_dark"
-- vim.g.material_style = "deep ocean"
-- vim.cmd("colorscheme onedark_dark")
