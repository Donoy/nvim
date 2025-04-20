return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "│", highlight = "IblChar" },
    scope = { char = "│", highlight = "IblScopeChar" },
  },
}
