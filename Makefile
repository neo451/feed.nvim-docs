page:
	rm -rf docs/
	npm run docs:build
	cp -r .vitepress/dist/ docs/
