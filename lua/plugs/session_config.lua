local fn = vim.fn
local session_dir = vim.fn.stdpath('data').."/sessions/"
if fn.empty(fn.glob(session_dir)) > 0 then
    fn.mkdir(session_dir)
end
require('auto-session').setup({
    log_level = 'error',
    auto_session_enable_last_session = true,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_create_enabled = false,
})
require('session-lens').setup {
    prompt_title = 'SESSIONS',
    theme_conf = {},
    path_display=nil,
}
