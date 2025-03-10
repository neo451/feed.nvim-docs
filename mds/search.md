# Search

- use `Feed search` to filter your feeds
- you can also pass the query like `Feed =neovim +read`
- the default query when you open up the index buffer is `+unread @2-weeks-ago`

## Regex

- no modifier matches entry title or entry url
- `!` is negative match with entry title or url
- `=` is matching feed name and feed url
- `~` is not matching feed name and feed url
- these all respect your `ignorecase` option

## Tags

- `+` means `must_have`, searches entries' tags
- `-` means `must_not_have`, searches entries' tags

## Date

- `@` means `date`, searches entries' date
- `2015-8-10` searches only entries after the date
- `2-months-ago` searches only entries within two months from now
- `1-year-ago--6-months-ago` means entries in the period

## Limit

- `#` means `limit`, limits the number of entries

## Examples

- `+blog +unread -star @6-months-ago #10 zig !rust`

Only Shows 10 entries with tags blog and unread, without tag star, and are published within 6 month, making sure they have zig but not rust in the title.

- `@6-months-ago +unread`

Only show unread entries of the last six months. This is the default filter.

- `linu[xs] @1-year-old`

Only show entries about Linux or Linus from the last year.

- `-unread +youtube #10`

Only show the most recent 10 previously-read entries tagged as youtube.

- `+unread !n\=vim`

Only show unread entries not having vim or nvim in the title or link.

- `+emacs =http://example.org/feed/`

Only show entries tagged as emacs from a specific feed.

## Grep

Use `Feed grep` to live grep all entries in your database,
requires `rg` and one of the search backends:

- `telescope`
- `fzf-lua`
- `mini.pick`
