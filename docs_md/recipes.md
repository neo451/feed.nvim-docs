# Recipes

**Change the highlight of the tags section and use emojis and mini.icons for tags**

```lua
require("feed").setup({
   ui = {
      tags = {
         color = "String",
         format = function(id, db)
            local icons = {
               news = "📰",
               tech = "💻",
               movies = "🎬",
               games = "🎮",
               music = "🎵",
               podcast = "🎧",
               books = "📚",
               unread = "🆕",
               read = "✅",
               junk = "🚮",
               star = "⭐",
            }

            local get_icon = function(name)
               if icons[name] then
                  return icons[name]
               end
               local has_mini, MiniIcons = pcall(require, "mini.icons")
               if has_mini then
                  local icon = MiniIcons.get("filetype", name)
                  if icon then
                     return icon .. " "
                  end
               end
               return name
            end

            local tags = vim.tbl_map(get_icon, db:get_tags(id))
            table.sort(tags)
            return "[" .. table.concat(tags, ", ") .. "]"
         end,
      },
   },
})
```

**Custom function and keymap**

```lua
local function play_podcast()
   local link = require("feed").get_entry().link
   if link:find("mp3") then
      vim.ui.open(link)
   -- any other player like:
   -- vim.system({ "vlc.exe", link })
   else
      vim.notify("not a podcast episode")
   end
end

local function show_in_w3m()
   if not vim.fn.executable("w3m") then
      vim.notify("w3m not installed")
      return
   end
   local link = require("feed").get_entry().link
   local w3m = require("feed.ui.window").new({
      relative = "editor",
      col = math.floor(vim.o.columns * 0.1),
      row = math.floor(vim.o.lines * 0.1),
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
      border = "rounded",
      style = "minimal",
      title = "Feed w3m",
      zindex = 10,
   })
   vim.keymap.set({ "n", "t" }, "q", "<cmd>q<cr>", { silent = true, buffer = w3m.buf })
   vim.fn.jobstart({ "w3m", link }, { term = true })
   vim.cmd("startinsert")
end

require("feed").setup({
   keys = {
      index = {
         { "p", play_podcast },
         { "w", show_in_w3m },
      },
   },
})
```

**Custom colorscheme only set when viewing feeds**

```lua

local og_color
local og_background

vim.api.nvim_create_autocmd("User", {
   pattern = "FeedShowIndex",
   callback = function()
      if not og_color then
         og_color = vim.g.colors_name
      end
      if not og_background then
         og_background = vim.opt.background
      end
      vim.cmd.colorscheme("e-ink")
      vim.opt.background = "light"
   end,
})

vim.api.nvim_create_autocmd("User", {
   pattern = "FeedQuitIndex",
   callback = function()
      vim.cmd.colorscheme(og_color)
      vim.opt.background = og_background
   end,
})
```

**Show estimate reading time**

```lua
require("feed").setup({
   ui = {
      order = { "date", "feed", "tags", "title", "reading_time" },
      reading_time = {
         color = "Comment",
         format = function(id, db)
            local cpm = 1000 -- set to whatever you like
            local content = db:get(id):gsub("%s+", " ") -- reads the entry content
            local chars = vim.fn.strchars(content)
            local time = math.ceil(chars / cpm)
            return string.format("(%s min)", time)
         end,
      },
   },
})
```

**Custom section in snacks dashboard**

```lua
local function gen_feed_sections()
   local feed = require("feed")
   local entries = feed.db:filter("+unread #5")
   local sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { pane = 2, title = "Feeds", padding = 1 },
   }

   for _, id in ipairs(entries) do
      table.insert(sections, {
         pane = 2,
         icon = " ",
         desc = feed.headline(id),
         action = function()
            feed.show_entry({ id = id })
         end,
      })
   end
   table.insert(sections, { section = "startup" })
   return sections
end

require("snacks").setup({
   dashboard = {
      sections = gen_feed_sections(),
   },
})
```
