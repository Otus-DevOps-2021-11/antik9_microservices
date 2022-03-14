include docker/.env

BUILD_SOURCES = build-ui build-post build-comment
PUSH_SOURCES  = push-ui push-post push-comment push-prometheus

build-all: build-prometheus ${BUILD_SOURCES}

${BUILD_SOURCES}:
	cd src/$(subst build-,,$@) && ./docker_build.sh

build-prometheus:
	@docker build -t ${USERNAME}/prometheus -f monitoring/prometheus/Dockerfile

push-all: ${PUSH_SOURCES}

${PUSH_SOURCES}:
	@docker push ${USERNAME}/$(subst push-,,$@)
