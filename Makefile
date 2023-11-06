build-all-in-one:
	docker build . -t vulnerable-awker:all-in-one -f dockerfiles/Dockerfile.all-in-one

run-all-in-one:
	docker run --rm -it -p 8080:8080 vulnerable-awker:all-in-one

build-multi-stage-ubuntu:
	docker build . -t vulnerable-awker:multi-stage-ubuntu -f dockerfiles/Dockerfile.multi-stage-ubuntu

run-multi-stage-ubuntu:
	docker run --rm -it -p 8080:8080 vulnerable-awker:multi-stage-ubuntu

build-multi-stage-alpine:
	docker build . -t vulnerable-awker:multi-stage-alpine -f dockerfiles/Dockerfile.multi-stage-alpine

run-multi-stage-alpine:
	docker run --rm -it -p 8080:8080 vulnerable-awker:multi-stage-alpine
