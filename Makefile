build-all-in-one:
	docker build . -t vulnerable-awker:all-in-one -f dockerfiles/Dockerfile.all-in-one

run-all-in-one:
	docker run --rm -it -p 8080:8080 vulnerable-awker:all-in-one

build-multi-stage-debian:
	docker build . -t vulnerable-awker:multi-stage-debian -f dockerfiles/Dockerfile.multi-stage-ubuntu

run-multi-stage-debian:
	docker run --rm -it -p 8080:8080 vulnerable-awker:multi-stage-debian

build-multi-stage-alpine:
	docker build . -t vulnerable-awker:multi-stage-alpine -f dockerfiles/Dockerfile.multi-stage-alpine

run-multi-stage-alpine:
	docker run --rm -it -p 8080:8080 vulnerable-awker:multi-stage-alpine

build-multi-stage-chainguard:
	docker build . -t vulnerable-awker:multi-stage-chainguard -f dockerfiles/Dockerfile.multi-stage-chainguard

run-multi-stage-chainguard:
	docker run --rm -it -p 8080:8080 vulnerable-awker:multi-stage-chainguard
