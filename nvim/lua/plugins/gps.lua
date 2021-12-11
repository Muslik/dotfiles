local icons = VimConfig.icons

require("nvim-gps").setup({
  icons = {
    ["container-name"] = icons.container,
  },
  separator = ' > ',
})

