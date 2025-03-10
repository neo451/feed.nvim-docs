# feed.nvim Docs

Online documentation for [feed.nvim](https://github.com/neo451/feed.nvim) plugin, automatically built from the
[docs](https://github.com/nvim-orgmode/orgmode/tree/master/docs) folder in the [nvim-orgmode](https://github.com/nvim-orgmode/orgmode) repository.

DO NOT submit PRs to this repository. All changes to the documentation should be made in the [nvim-orgmode docs](https://github.com/nvim-orgmode/orgmode/tree/master/docs) folder.

---

### View this documentation locally

1.  Dependencies

    1.  [nodejs](https://nodejs.org/) - Version 18 or later
    2.  [pandoc](https://pandoc.org/) - Version 3.5 or later

2.  How to run

    1.  Run `npm install` to install the dependencies.
    2.  Run `npm run docs:dev` to start the development server.

3.  How it works

    Publishing documentation to the Github pages follows a multi-step
    process:

    1.  Once `docs` are updated in the[
        nvim-orgmode](https://github.com/nvim-orgmode/orgmode)
        repository,
        [workflow](https://github.com/nvim-orgmode/orgmode/blob/master/.github/workflows/web_docs.yml)
        runs to push the `docs` folder to this repository
    2.  Once the `docs` folder is up to date, another
        [workflow](https://github.com/nvim-orgmode/nvim-orgmode.github.io/blob/main/.github/workflows/deploy.yml)
        runs, which does these steps:
        1.  Converts `org` files to `markdown` files with `pandoc`
        2.  Builds the `vitepress` site from the `markdown` files
        3.  Pushes the `vitepress` site to the `gh-pages` branch
