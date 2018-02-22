include config.mk

DESTINATION=${REPO}/${IMAGE}

all: opt build push git
base: opt build-base push-base git-base
dev: opt build-dev push-dev git-dev
ci: opt build-ci push-ci git-ci

opt:
	@echo "build options:"
	@echo "  REPO    = ${REPO}"
	@echo "  IMAGE   = ${IMAGE}"
	@echo "  VERSION = ${VERSION}"

build: build-base build-dev build-ci

build-base:
	docker build -t ${DESTINATION}:latest base

build-dev:
	docker build -t ${DESTINATION}:dev-${VERSION} dev

build-ci:
	docker build -t ${DESTINATION}:ci-${VERSION} ci

push: push-base push-dev push-ci

push-base:
	docker tag ${DESTINATION}:latest ${DESTINATION}:${VERSION}
	docker push ${DESTINATION}:latest
	docker push ${DESTINATION}:${VERSION}

push-dev:
	docker push ${DESTINATION}:dev-${VERSION}

push-ci:
	docker push ${DESTINATION}:ci-${VERSION}

git: git-base git-dev git-ci

git-base:
	git add -A base
	git commit -m "Docker image version ${DESTINATION}:${VERSION}"
	git tag ${VERSION}
	git push
	git push origin ${VERSION}

git-dev:
	git add -A ci
	git commit -m "Docker image version ${DESTINATION}:ci-${VERSION}"
	git tag ci-${VERSION}
	git push
	git push origin ci-${VERSION}

git-ci:
	git add -A ci
	git commit -m "Docker image version ${DESTINATION}:ci-${VERSION}"
	git tag ci-${VERSION}
	git push
	git push origin ci-${VERSION}
