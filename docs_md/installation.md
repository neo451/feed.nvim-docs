# 🚀 Installation

## Requirements

- Neovim 0.10+
- curl
- [pandoc](https://www.pandoc.org)
- tree-sitter parser
  - xml
  - html

## Optional Dependencies

- For feed greping:
  - [rg](https://github.com/BurntSushi/ripgrep)
- For interactive feed searching:
  - [telescope.nvim](https://github.com/folke/snacks.nvim)
  - [fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - [mini.pick](https://github.com/echasnovski/mini.pick)
- For markdown rendering:
  - [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)
  - [markview.nvim](https://github.com/OXY2DEV/markview.nvim)
- For image rendering:
  - [snacks.nvim](https://github.com/folke/snacks.nvim)

## Basic Installation

For [rocks.nvim](https://github.com/nvim-neorocks/rocks.nvim):

```vim
:Rocks install feed.nvim
```

For [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
   "neo451/feed.nvim",
   cmd = "Feed",
   ---@module 'feed'
   ---@type feed.config
   opts = {},
}
```

## Further Steps

- Run `:checkhealth feed` to see your installation status
- Read tutorial below or read `:h feed.txt`
- To troubleshoot without conflict from other plugins or you config, copy `minimal.lua` in the repo locally, and do `nvim --clean -u minimal.lua`

<!-- panvimdoc-ignore-end -->
