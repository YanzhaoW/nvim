local lua_snippet = require("luasnip")
-- local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt

local snippet = lua_snippet.snippet
-- local text = lua_snippet.text_node
local insert = lua_snippet.insert_node
-- local rep = extras.rep

lua_snippet.add_snippets("cpp", {
    snippet("//!<", fmt([[//!< {}]], { insert(1) })),
    snippet(
        "doxfun",
        fmt(
            [[
/**
 * @brief {}
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
        )
    ),
    snippet(
        "doxclass",
        fmt(
            [[
/**
 * @class {}
 * @brief {}
 *
 * {}
 */
            ]],
            {
                insert(1, "class name"),
                insert(2, "brief description"),
                insert(3, "description"),
            }
        )
    ),
    snippet("cling", fmt(
        [[
#ifndef __CLING__
#endif
            ]], {}
    )),
    snippet("has-cxx-17", fmt(
        [[
#ifdef HAS_CXX_17
#else
#endif
            ]], {}
    )),
})

lua_snippet.add_snippets("markdown", {
    snippet("$$", fmt([[@f${}@f$]], { insert(1, "content") })),
    snippet("refeq", fmt([[@f$\ref{{eq:{}}}@f$]], { insert(1, "label") })),
})

lua_snippet.add_snippets("cmake", {
    snippet(
        "init",
        fmt(
            [[
cmake_minimum_required(VERSION 3.28)

project({})

set(CMAKE_CXX_STANDARD 23)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE {})
        ]],
            {
                insert(1, "project_name"),
                insert(2, "dependencies"),
            }
        )
    ),
})

lua_snippet.add_snippets("tex", {
    snippet(
        "frame",
        fmt(
            [[
\begin{{frame}}[t]{{{}}}
\end{{frame}}
            ]],
            {
                insert(1, "frame title"),
            }
        )
    ),
    snippet(
        "columns",
        fmt(
            [[
\begin{{columns}}[t]
    \begin{{column}}{{0.45 \textwidth}}
    \end{{column}}
    \begin{{column}}{{0.45 \textwidth}}
    \end{{column}}
\end{{columns}}
            ]],
            {}
        )
    ),
    snippet(
        "figure",
        fmt(
            [[
\begin{{figure}}
    \includegraphics[width = \textwidth]{{{}}}
\end{{figure}}
        ]],
            {
                insert(1, "image"),
            }
        )
    ),
})

require("keymapping").snippet()
