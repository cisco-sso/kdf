
.PHONY: run
run:
	rm -rf ./public ; hugo server -D --bind 0.0.0.0 --disableFastRender
