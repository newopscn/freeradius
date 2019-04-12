all: push

TAG=`cat TAG`
APP=freeradius
IMAGE=hub.digi-sky.com/base/${APP}:${TAG}
REMOTE_IMAGE=newops/${APP}:${TAG}

build:
	docker build -t ${IMAGE} .

push: build
	docker push ${IMAGE}

push2tx: build
	docker tag ${IMAGE} ${REMOTE_IMAGE}
	docker push ${REMOTE_IMAGE}

dev:
	docker run -it --rm --name ${APP} \
		-p 1812:1812 \
		-p 1813:1813 \
		-v `pwd`:/usr/src/app \
		${IMAGE} sh

conn:
	docker exec -it ${APP} sh

clean:
	docker stop ${APP}
	docker rm ${APP}

.PHONY: push
