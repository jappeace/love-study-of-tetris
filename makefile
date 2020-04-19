default: run

run: 
	nix-shell --run "love ."

package: lint
	@- zip -r out/deadly-siege.love *

clean:
	@- rm -rf out/*

.PHONY: default run package clean lint
