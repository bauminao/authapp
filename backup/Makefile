IMAGE_NAME = bauminao/authapp
CONTAINER_NAME = authapp

.PHONY: all

all: clean_all build run

clean: clean_container

clean_all: clean_container clean_image

clean_image:
	docker rmi -f ${IMAGE_NAME} 2>/dev/null || true
	docker images | grep ${IMAGE_NAME} || true

clean_container:
	docker rm -f ${CONTAINER_NAME} 2>/dev/null || true
	docker ps -a

build: clean_all
	docker build -t ${IMAGE_NAME} .

stop:
	docker stop ${CONTAINER_NAME}

run: clean
	docker run --name=${CONTAINER_NAME} \
		-v $$PWD/docker_data:/docker      \
		-v $$PWD/app:/home/node/authapp   \
		-p 8001:8001                      \
		-ti -d ${IMAGE_NAME}
	sleep 1
	docker logs --details ${CONTAINER_NAME}

run_ssh: clean
	docker run --name=${CONTAINER_NAME} \
		-v $$PWD/docker_data:/docker      \
		-v $$PWD/app:/home/node/authapp   \
		-p 8001:8001                      \
		-ti ${IMAGE_NAME} /bin/bash

restart: stop
	docker restart ${CONTAINER_NAME}

status:
	docker logs ${CONTAINER_NAME}

ssh:
	docker exec -ti ${CONTAINER_NAME} bash

shell:
	docker exec -ti ${CONTAINER_NAME} bash

# Just Memo
donotforget:
	-v $$PWD/data:/data        \

