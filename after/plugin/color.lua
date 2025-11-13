local grey = "#928374"
local dark_bg = "#1d2021"
local rose_pine_moon_rose = "#ea9a97"
local rose_pine_moon_variabel_member_custom = "#c7b8d7"

vim.g.gruvbox_bold = 1
vim.g.gruvbox_contrast_dark = "hard"

require("onedarkpro").setup({
    highlights = {
        ["@variable"]              = { fg = "#abb2bf" },
        ["@lsp.type.variable"]     = { fg = "#abb2bf" },
        Identifier = { fg = "#abb2bf" }
    }
})

require("rose-pine").setup({
    variant = "moon",
    highlight_groups = {
        Normal = { bg = dark_bg },
        Comment = { fg = grey },
        ["@variable.member"] = { fg = rose_pine_moon_variabel_member_custom },
        ["@function.method.call"] = { fg = rose_pine_moon_rose },
  },
})

-- vim.cmd.colorscheme("gruvbox")
vim.cmd.colorscheme("rose-pine-moon")
-- vim.cmd.colorscheme("onedark")

-- COMMENTS (all kinds)
vim.api.nvim_set_hl(0, "Comment",               { fg = grey })
vim.api.nvim_set_hl(0, "@comment",              { fg = grey })
vim.api.nvim_set_hl(0, "@string.documentation", { fg = grey })

--
-- -- FUNCTION CALLS
-- local blue = "#83a598"
-- -- tree-sitter
-- vim.api.nvim_set_hl(0, "@function",      { fg = blue })
-- vim.api.nvim_set_hl(0, "@function.call",  { fg = blue })
-- vim.api.nvim_set_hl(0, "@method",         { fg = blue })
-- vim.api.nvim_set_hl(0, "@method.call",    { fg = blue })
-- -- legacy (fallback)
-- vim.api.nvim_set_hl(0, "Function",        { fg = blue })


-- darker background
vim.api.nvim_set_hl(0, "Normal", { bg = "#1d2021" }) -- #121212 
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1d2021" }) -- #121212
--
-- local grey = "#3c3836"
--
-- vim.api.nvim_set_hl(0, "LineNr",        { fg = grey })
-- vim.api.nvim_set_hl(0, "CursorLineNr",  { fg = grey })
-- vim.api.nvim_set_hl(0, "SignColumn",    { bg = grey })   -- or fg if you want icons colored
-- vim.api.nvim_set_hl(0, "FoldColumn",    { fg = grey, bg = grey })
--
-- local gutter_bg = "#1d2021"   -- your dark grey
--
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = gutter_bg })
--
-- -- local function keep_fg_and_set_bg(name)
-- --   local prev = vim.api.nvim_get_hl(0, { name = name })
-- --   vim.api.nvim_set_hl(0, name, { fg = prev.fg, bg = gutter_bg })
-- -- end
-- --
-- -- for _, name in ipairs {
-- --   "DiagnosticSignError",
-- --   "DiagnosticSignWarn",
-- --   "DiagnosticSignInfo",
-- --   "DiagnosticSignHint",
-- -- } do
-- --   keep_fg_and_set_bg(name)
-- -- end


-- THEME-SPECIFIC CUSTOMIZATIONS


-- require("catppuccin").setup({
--     flavour = "mocha",
--     color_overrides = {
--         mocha = {
--             base = "#16161e",
--             mantle = "#14141c",  -- optional: slightly darker than base
--             crust  = "#111117",  -- optional: darkest shade
--         },
--     },
-- })

-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_enable_bold = 1
-- -- swap:
-- vim.g.gruvbox_material_colors_override = {
    --     green = { "#89b482", "108" }, -- was aqua
    --     aqua  = { "#a9b665", "142" }, -- was green
    -- }
