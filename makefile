default: run

lint:
	@- find src/ -name '*.lua' -type f | xargs luacheck

run: lint
	@- love .

package: lint
	@- zip -r out/deadly-siege.love *

clean:
	@- rm -rf out/*

.PHONY: default run package clean lint
