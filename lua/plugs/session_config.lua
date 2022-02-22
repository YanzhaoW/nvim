local fn = vim.fn
local session_dir = vim.fn.stdpath('data').."/sessions/"
if fn.empty(fn.glob(session_dir)) > 0 then
    fn.mkdir(session_dir)
end
require('session_manager').setup({
    session_dir=session_dir
})
