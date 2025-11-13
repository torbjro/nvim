local grey = "#928374"
local dark_bg = "#1d2021"
local rose_pine_moon_rose = "#ea9a97"
local rose_pine_moon_variabel_member_custom = "#c7b8d7"


require("rose-pine").setup({
    variant = "moon",
    highlight_groups = {
        Normal = { bg = dark_bg },
        Comment = { fg = grey },
        ["@variable.member"] = { fg = rose_pine_moon_variabel_member_custom },
        ["@function.method.call"] = { fg = rose_pine_moon_rose },
        ["@property"] = { fg = rose_pine_moon_variabel_member_custom },
        -- TODO: double check if attributes are needed
        ["@attribute"] = { fg = rose_pine_moon_variabel_member_custom },
        ["@attribute.builtin"] = { fg = rose_pine_moon_variabel_member_custom },
  },
})


vim.cmd.colorscheme("rose-pine-moon")
