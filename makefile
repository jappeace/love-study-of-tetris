default: run

run: 
	nix-shell -p love_11 --run "love ."

package: lint
	@- zip -r out/deadly-siege.love *

clean:
	@- rm -rf out/*

.PHONY: default run package clean lint
