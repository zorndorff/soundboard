
.PHONY: test start
source_files := $(src/**/*.{js, ts})


node_modules: package.json
	npm install

dist: $(source_files)
	npm run build

test: dist
	npm run test

start: node_modules
	npm run dev
publish: dist
	git checkout publish
	git merge --ff-only main
	rm -rf docs
	cp -r dist/ docs/
	git commit -am "Publish on $(date)" || echo No Changes To Publish
	git push origin publish
	git checkout main
