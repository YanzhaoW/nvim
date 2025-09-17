-- local masonPath = vim.fn.expand "$MASON"
-- require "sonarlint".setup {
--     filetypes = {
--         "cpp",
--     },
--     server = {
--         cmd = {
--             "sonarlint-language-server",
--             -- Ensure that sonarlint-language-server uses stdio channel
--             "-stdio",
--             "-analyzers",
--             -- -- paths to the analyzers you need, using those for python and java in this example
--             -- vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarpython.jar",
--             vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarcfamily.jar.asc",
--             -- vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjava.jar",
--         },
--         settings = {
--             sonarlint = {
--                 pathToCompileCommands = "build/compile_commands.json",
--                 -- rules = {

--                 -- },
--             },
--         },


--     },


-- }
