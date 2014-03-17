ROOT=$(CURDIR)
DEST=/opt/app
NODE=/usr/local/bin/node
NPM=/usr/local/bin/npm
IMAGE=joaodubas/nodejs-unstable:latest
NAME=generator
CMD=docker run -i -t --rm -v $(ROOT):$(DEST) -w $(DEST) --name $(NAME)

shell:
	@$(CMD) \
		--entrypoint $(NODE) \
		$(IMAGE) \
		--harmony

run:
	@$(CMD) \
		--entrypoint $(NODE) \
		$(IMAGE) \
		--harmony bin/$(file)

install:
	@$(CMD) \
		--entrypoint $(NPM) \
		$(IMAGE) \
		install $(pack)

.PHONY: shell run
