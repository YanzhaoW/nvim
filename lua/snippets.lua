local lua_snippet = require "luasnip"
local extras = require "luasnip.extras"
local fmt = require "luasnip.extras.fmt".fmt

local snippet = lua_snippet.snippet
local text = lua_snippet.text_node
local insert = lua_snippet.insert_node
local rep = extras.rep

lua_snippet.add_snippets("cpp",
    {
        snippet("//!<", fmt([[//!< {}]], { insert(1) })),
        snippet("doxfun", fmt(
            [[
/** 
 * \brief {}
 *
 * {}
 * @param {} {}
 * @return {} {}
 * @see {}
 */
            ]],
            {
                insert(1, "brief description"),
                insert(2, "detailed description"),
                insert(3, "name"),
                insert(4, "description"),
                insert(5, "name"),
                insert(6, "description"),
                insert(7, "ref"),
            }
        )),
    }
)

require "keymapping".snippet()
