.PHONY: test build run push

IMAGE_BASE = dappalachia
IMAGE = blockstack-react
MY_PWD := $(shell pwd)

all: build

test:
	docker network create $(IMAGE_BASE)_$(IMAGE)_test; \
	docker run -t --rm -v $(MY_PWD)/src:/app/src  -v $(MY_PWD)/test:/app/test -e "NODE_ENV=test" --net=$(IMAGE_BASE)_$(IMAGE)_test $(IMAGE_BASE)/$(IMAGE) npm test; \
	status=$$?; \
	docker network rm $(IMAGE_BASE)_$(IMAGE)_test; \
	exit $$status

build:
ifdef NOCACHE
	docker build --no-cache -t $(IMAGE_BASE)/$(IMAGE) .
else
	docker build -t $(IMAGE_BASE)/$(IMAGE) .
endif

push:
	docker push $(IMAGE_BASE)/$(IMAGE)

run:
	docker run -it --rm --name $(IMAGE) -v $(MY_PWD):/app -p 8080:8080 -e "NODE_ENV=dev" $(IMAGE_BASE)/$(IMAGE)

install:
	docker run -it --rm --name $(IMAGE)-install -v $(MY_PWD):/app -e "NODE_ENV=dev" $(IMAGE_BASE)/$(IMAGE) npm install

shell:
	docker exec -it $(IMAGE) sh

yo-shell:
	docker run -it --rm -v $(MY_PWD):/app $(IMAGE_BASE)/blockstack-yo