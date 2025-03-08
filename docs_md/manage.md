# Manage

## From lua

Pass your feeds as list of links and tags in setup

Use `Feed update` to update all

Use `Feed update_feed` to update one feed

```lua
require("feed").setup({
   feeds = {
      -- These two styles both work
      "https://neovim.io/news.xml",
      {
         "https://neovim.io/news.xml",
         name = "Neovim News",
         tags = { "tech", "news" }, -- tags given are inherited by all its entries
      },

      -- three link formats:
      "https://neovim.io/news.xml", -- Regular links
      "rsshub://rsshub://apnews/topics/apf-topnews", -- RSSHub links
      "neovim/neovim/releases", -- GitHub links
   },
})
```

## From OPML

Use `Feed load_opml` to import your OPML file

Use `Feed export_opml` to export your OPML file to load in other readers

## Link formats

## Regular links

Must start with `http` or `https`

## RSSHub links

RSSHub links are first class citizens, format is `rsshub://{route}`

`rsshub://{route}` will be resolved when fetching according to your config

Discover available `{route}` in [RSSHub documentation](https://docs.rsshub.app/routes/popular)
`rsshub://apnews/topics/apf-topnews` will be resolved to `https://rsshub.app/apnews/topics/apf-topnews` by default

Config example:

```lua
require("feed").setup({
   rsshub = {
      instance = "127.0.0.1:1200", -- or any public instance listed here https://rsshub.netlify.app/instances
      export = "https://rsshub.app", -- used in export_opml
   },
})
```

## GitHub links

GitHub user/repo links are also first class citizens,format is `[github://]{user/repo}[{/releases|/commits}]`, so following four all work:

- `neo451/feed.nvim`
- `github://neo451/feed.nvim`
- `neo451/feed.nvim/releases`
- `github://neo451/feed.nvim/releases`

For now it defaults to subscribing to the commits

So first two is resolved into <https://github.com/neo451/feed.nvim/commits.atom>

Latter two is resolved into <https://github.com/neo451/feed.nvim/releases.atom>
