ROOT=$(CURDIR)
DEST=/opt/app
NODE=/usr/local/bin/node
NPM=/usr/local/bin/npm
IMAGE=joaodubas/nodejs-unstable:latest
NAME=generator
CMD=docker run -i -t -v $(ROOT):$(DEST) -w $(DEST) -name $(NAME)

shell:
	@$(CMD) \
		-entrypoint $(NODE) \
		$(IMAGE) \
		--harmony
	@$(MAKE) kill

run:
	@$(CMD) \
		-entrypoint $(NODE) \
		$(IMAGE) \
		--harmony bin/$(file)
	@$(MAKE) kill

install:
	@$(CMD) \
		-entrypoint $(NPM) \
		$(IMAGE) \
		install $(pack)
	@$(MAKE) kill

kill:
	@/usr/bin/docker kill $(NAME)
	@/usr/bin/docker rm $(NAME)

.PHONY: shell run kill
