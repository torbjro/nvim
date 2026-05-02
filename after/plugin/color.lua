local grey = "#928374"
local dark_bg = "#1d2021"
local soft_grey = "#aca398"
local comment_grey = "#7f766b"
local rose_pine_moon_rose = "#ea9a97"
local rose_pine_moon_variabel_member_custom = "#c7b8d7"


require("rose-pine").setup({
    variant = "moon",
    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },
    highlight_groups = {
        Normal = { bg = dark_bg },
        NormalNC = { bg = dark_bg },
        Comment = { fg = grey },
        -- Syntax
        ["@string.documentation"] = { fg = grey },
        ["@variable.member"] = { fg = soft_grey },
        ["@variable.parameter"] = { fg = soft_grey },
        ["@function.method.call"] = { fg = rose_pine_moon_rose },
        ["@property"] = { fg = soft_grey },
        -- TODO: double check if attributes are needed
        ["@attribute"] = { fg = rose_pine_moon_variabel_member_custom },
        ["@attribute.builtin"] = { fg = rose_pine_moon_variabel_member_custom },
        -- Telescope
        NormalFloat = { bg = dark_bg },
        FloatBorder = { bg = dark_bg, fg = grey },
        TelescopeBorder = { bg = dark_bg, fg = grey },
        TelescopeNormal = { bg = dark_bg },
        TelescopePromptNormal = { bg = dark_bg },
        TelescopeResultsNormal = { bg = dark_bg },
        TelescopePreviewNormal = { bg = dark_bg },
  },
})


local function set_ayu_overrides()
    local set = vim.api.nvim_set_hl

    local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    local type_hl = vim.api.nvim_get_hl(0, { name = "Type" })
    local function_hl = vim.api.nvim_get_hl(0, { name = "Function" })

    local normal_fg = normal_hl.fg
    local type_fg = type_hl.fg
    local function_fg = function_hl.fg

    local namespace_grey = 0x8C8F93
    local member_grey = normal_fg

    -- Namespaces (not yellow like functions)
    set(0, "@namespace", { fg = namespace_grey })
    set(0, "@module", { fg = namespace_grey })

    set(0, "@lsp.type.namespace", { fg = namespace_grey })
    set(0, "@lsp.type.module", { fg = namespace_grey })
    set(0, "@lsp.typemod.namespace.cpp", { fg = namespace_grey })

    -- Member variables (not blue like types)
    set(0, "@property", { fg = member_grey })
    set(0, "@field", { fg = member_grey })
    set(0, "@variable.member", { fg = member_grey })
    set(0, "@variable.member.builtin", { fg = member_grey })

    set(0, "@lsp.type.property", { fg = member_grey })
    set(0, "@lsp.type.field", { fg = member_grey })
    set(0, "@lsp.type.member", { fg = member_grey })
    set(0, "@lsp.typemod.member.readonly", { fg = member_grey })
    set(0, "@lsp.typemod.variable.readonly", { fg = member_grey })
    set(0, "@lsp.typemod.variable.mutable", { fg = member_grey })

    -- Special same as types
    set(0, "Special", { fg = type_fg })
    set(0, "@special", { fg = type_fg })

    -- Keep functions yellow and bold
    set(0, "@function", { fg = function_fg, bold = true })
    set(0, "@function.method", { fg = function_fg, bold = true })
    set(0, "@method", { fg = function_fg, bold = true })

    set(0, "@function.call", { fg = function_fg })
    set(0, "@function.method.call", { fg = function_fg })
    set(0, "@method.call", { fg = function_fg })
end


vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "ayu",
    callback = function()
        set_ayu_overrides()
    end,
})


local function set_melange_overrides()
    vim.api.nvim_set_hl(0, "Comment", { fg = comment_grey })

    local function_link = "Function"
    -- functions & methods
    vim.api.nvim_set_hl(0, "@function",              { link = function_link, bold = true })
    vim.api.nvim_set_hl(0, "@function.call",         { link = function_link })
    vim.api.nvim_set_hl(0, "@function.builtin",      { link = function_link })
    vim.api.nvim_set_hl(0, "@function.method",       { link = function_link, bold = true })
    vim.api.nvim_set_hl(0, "@function.method.call",  { link = function_link })
    vim.api.nvim_set_hl(0, "@method",                { link = function_link, bold = true })
    vim.api.nvim_set_hl(0, "@method.call",           { link = function_link })

    -- classes & types
    vim.api.nvim_set_hl(0, "@class",       { link = "@type" })
    vim.api.nvim_set_hl(0, "@constructor", { link = "@type" })

    -- parameters & members
    vim.api.nvim_set_hl(0, "@variable.parameter", { fg = soft_grey })
    vim.api.nvim_set_hl(0, "@property",           { fg = soft_grey })
    vim.api.nvim_set_hl(0, "@field",              { fg = soft_grey })
    vim.api.nvim_set_hl(0, "@variable.member",    { fg = soft_grey })
    vim.api.nvim_set_hl(0, "@variable.member.builtin",    { fg = soft_grey })
    vim.api.nvim_set_hl(0, "@variable.paramter.builtin",  { fg = soft_grey })

    -- lsp semantic
    local lsp = vim.api.nvim_set_hl
    lsp(0, "@lsp.type.function",                    { link = function_link, bold = true })
    lsp(0, "@lsp.typemod.function.defaultLibrary",  { link = function_link })
    lsp(0, "@lsp.typemod.function.declaration",     { link = function_link, bold = true })
    lsp(0, "@lsp.type.method",                      { link = function_link, bold = true })
    lsp(0, "@lsp.typemod.method.defaultLibrary",    { link = function_link })
    lsp(0, "@lsp.typemod.method.declaration",       { link = function_link, bold = true })
    lsp(0, "@lsp.typemod.function.globalScope.cpp", { link = function_link })

    lsp(0, "@lsp.type.class",                      { link = "@type" })
    lsp(0, "@lsp.typemod.class.defaultLibrary",    { link = "@type" })
    lsp(0, "@lsp.type.interface",                  { link = "@type" })
    lsp(0, "@lsp.type.struct",                     { link = "@type" })

    -- cpp
    lsp(0, "@type.cpp",                            { link = "@type" })
    lsp(0, "@lsp.typemod.enum.defaultLibrary.cpp", { link = "@type" })
    lsp(0, "@lsp.typemod.enum.fileScope.cpp",      { link = "@type" })
    lsp(0, "@lsp.mod.enum.defaultLibrary.cpp",     { link = "@type" })
    lsp(0, "@lsp.mod.enum.fileScope.cpp",          { link = "@type" })
    lsp(0, "@lsp.typemod.enum.globalScope.cpp",    { link = "@type" })

    lsp(0, "@lsp.mod.defaultLibrary.cpp",                { link = "Constant" })
    lsp(0, "@lsp.typemod.enumMember.defaultLibrary.cpp", { link = "Constant" })
    lsp(0, "@lsp.mod.readonly.cpp",                      { link = "Constant" })
    lsp(0, "@lsp.mod.globalScope.cpp",                   { link = "Constant" })
    lsp(0, "@lsp.typemod.enumMember.globalScope.cpp",    { link = "Constant" })
    lsp(0, "@lsp.typemod.enumMember.readonly.cpp",       { link = "Constant" })

    lsp(0, "@lsp.type.parameter",                  { fg = soft_grey })
    lsp(0, "@lsp.type.property",                   { fg = soft_grey })
    lsp(0, "@lsp.type.field",                      { fg = soft_grey })
    lsp(0, "@lsp.type.member",                     { fg = soft_grey })
    lsp(0, "@lsp.typemod.member.readonly",         { fg = soft_grey })
    lsp(0, "@lsp.typemod.variable.readonly",       { fg = soft_grey })
    lsp(0, "@lsp.typemod.variable.mutable",        { fg = soft_grey })

    -- legacy ts
    lsp(0, "TSFunction",      { link = function_link, bold = true })
    lsp(0, "TSFunctionCall",  { link = function_link })
    lsp(0, "TSMethod",        { link = function_link, bold = true })
    lsp(0, "TSMethodCall",    { link = function_link })
    lsp(0, "TSType",          { link = "@type" })
    lsp(0, "TSParameter",     { fg = soft_grey })


    local func_hl = vim.api.nvim_get_hl(0, { name = "Function" })
    local func_fg = func_hl.fg

    local statement_hl = vim.api.nvim_get_hl(0, { name = "Statement" })
    local statements_fg = statement_hl.fg

    local function set_bold_functions(group, is_bold)
        vim.api.nvim_set_hl(0, group, { fg = func_fg, bold = is_bold, force = true })
    end

    local function set_bold_control_flow(group, is_bold)
        vim.api.nvim_set_hl(0, group, { fg = statements_fg, bold = is_bold, force = true })
    end

    local bold_groups_functions = {
        "@function",
        "@function.method",
        "@method",
        -- "@lsp.type.function",
        -- "@lsp.type.method",
        "@lsp.typemod.function.declaration",
        "@lsp.typemod.method.declaration",
    }
    for _, g in ipairs(bold_groups_functions) do set_bold_functions(g, true) end

    local plain_groups_functions = {
        "@function.call",
        "@function.method.call",
        "@method.call",
        "@function.builtin",           -- Specifically for print() in Treesitter
        "@lsp.typemod.function.builtin", -- Specifically for print() in LSP
        "@lsp.typemod.function.defaultLibrary",
        "@lsp.typemod.method.defaultLibrary",
        "@lsp.mod.defaultLibrary",
    }
    for _, g in ipairs(plain_groups_functions) do set_bold_functions(g, false) end

    local bold_groups_statements = {
        "Statement",
        -- "@keyword.conditional.python",
    }
    for _, g in ipairs(bold_groups_statements) do set_bold_control_flow(g, true) end

end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "melange",
    callback = function()
        set_melange_overrides()
    end,
})


require("tokyonight").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end
})


require("black-metal").setup({
  theme = "bathory",
  variant = "dark",
  alt_bg = false,
  colored_docstrings = false,
  cursorline_gutter = true,
  dark_gutter = false,
  favor_treesitter_hl = false,
  plain_float = false,
  show_eob = true,
  term_colors = true,
  toggle_variant_key = nil,
  transparent = false,
  diagnostics = {
    darker = true,
    undercurl = true,
    background = true,
  },
  code_style = {
    comments = "italic",
    conditionals = "bold",
    functions = "none",
    keywords = "bold",
    headings = "bold", -- Markdown headings
    operators = "bold",
    keyword_return = "bold",
    strings = "none",
    variables = "none",
  },
  plugin = {
    lualine = {
      bold = true,
      plain = false,
    },
    cmp = {
      plain = false,
      reverse = false,
    },
  },
  colors = {
      parameters = '#5f8787',
  },
  highlights = {
      ["@lsp.typemod.parameter.readonly.cpp"] = { fg = "$parameters" },
  },
})
require("black-metal").load()
