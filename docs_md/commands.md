# Commands

## Sub commands and arguments

To execute actions available in the current context,
or give arguments to the command, use the following syntax:

Use `:Feed <Tab>`, `:Feed update_feed <Tab>` to get the completion

Use `:Feed<Enter>`, `:Feed update_feed<Enter>` to open menu and select

## List of commands

| name                            | desc                                                                                | bang |
| ------------------------------- | ----------------------------------------------------------------------------------- | ---- |
| `Feed [query]`                  | opens a index buffer, a list view based on the filter you passed in                 | no   |
| `Feed index`                    | opens a index buffer, a list view based on your default filter                      | no   |
| `Feed entry`                    | opens a entry buffer, a markdown view of the entry content                          | no   |
| `Feed update`                   | updates all feeds in the database                                                   | no   |
| `Feed update_feed [feed_url]`   | update a single feed in the database                                                | no   |
| `Feed sync`                     | sync the database with your config, removes feeds and entries (if bang) not present | yes  |
| `Feed search [query]`           | opens picker to live search your database                                           | no   |
| `Feed grep`                     | opens picker to live grep your database (experimental)                              | no   |
| `Feed list`                     | opens a split to show info about all your feeds in database                         | no   |
| `Feed log`                      | opens a split to show log                                                           | no   |
| `Feed load_opml [filepath/url]` | import from an OPML file or url                                                     | no   |
| `Feed export_opml [filepath]`   | export to an OPML file                                                              | no   |
| `Feed web [port]`               | opens a server on a port and opens the web interface in browser                     | no   |
| `Feed urlview`                  | opens a select UI to picker urls in entry buffer, `<cr>` to open in browser         | no   |
