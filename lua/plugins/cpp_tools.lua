require "nt-cpp-tools".setup {
    preview = {
        quit = "q",       -- optional keymapping for quit preview
        accept = "<tab>", -- optional keymapping for accept preview
    },
    -- header_extension = 'h', -- optional
    -- source_extension = 'cxx', -- optional
    custom_define_class_function_commands = { -- optional
        CppImplPreview = { output_handle = require "nt-cpp-tools.output_handlers".get_preview_and_apply(), },
        --[[
        <your impl function custom command name> = {
            output_handle = function (str, context)
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
    },
}

-- local osys = require "cmake-tools.osys"

-- require "cmake-tools".setup {
--     cmake_build_directory = function()
--         return "build"
--     end,
--     cmake_compile_commands_options = {
--         action = "lsp", -- available options: soft_link, copy, lsp, none
--         -- soft_link: this will automatically make a soft link from compile commands file to target
--         -- copy:      this will automatically copy compile commands file to target
--         -- lsp:       this will automatically set compile commands file location using lsp
--         -- none:      this will make this option ignored
--         target = vim.loop.cwd(), -- path to directory, this is used only if action == "soft_link" or action == "copy"
--     },
--     cmake_executor = {
--         name = "toggleterm",
--         default_opts = {
--             quickfix = { show = "always", auto_close_when_sucess = false, position = "botright", -- "bottom", "top"
--             },
--         },
--     },
--     cmake_runner = {
--         name = "toggleterm",
--         default_opts = {
--             quickfix = {
--                 show = "always",
--                 position = "botright", --"vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright"
--                 auto_close_when_sucess = false,
--             },
--             toggleterm = {
--                 direction = "float",   -- 'vertical' | 'horizontal' | 'tab' | 'float'
--                 close_on_exit = false, -- whether close the terminal when exit
--                 auto_scroll = true,    -- whether auto scroll to the bottom
--             },
--         },
--     },
-- }
