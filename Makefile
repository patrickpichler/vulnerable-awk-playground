build-all-in-one:
	docker build . -t vulernable-awk-playground:all-in-one -f dockerfiles/Dockerfile.all-in-one

run-all-in-one:
	docker run --rm -it -p 8080:8080 vulernable-awk-playground:all-in-one

build-multi-stage-debian:
	docker build . -t vulernable-awk-playground:multi-stage-debian -f dockerfiles/Dockerfile.multi-stage-ubuntu

run-multi-stage-debian:
	docker run --rm -it -p 8080:8080 vulernable-awk-playground:multi-stage-debian

build-multi-stage-alpine:
	docker build . -t vulernable-awk-playground:multi-stage-alpine -f dockerfiles/Dockerfile.multi-stage-alpine

run-multi-stage-alpine:
	docker run --rm -it -p 8080:8080 vulernable-awk-playground:multi-stage-alpine

build-multi-stage-chainguard:
	docker build . -t vulernable-awk-playground:multi-stage-chainguard -f dockerfiles/Dockerfile.multi-stage-chainguard

run-multi-stage-chainguard:
	docker run --rm -it -p 8080:8080 vulernable-awk-playground:multi-stage-chainguard

melange.rsa melange.rsa.pub:
	melange keygen

packages/aarch64/APKINDEX.json: melange.rsa melange.rsa.pub melange.yaml
	DOCKER_HOST=$$(docker context inspect -f '{{ .Metadata.Endpoints.docker.Host }}') \
							melange build --arch arm64 \
														--runner docker \
														--workspace-dir /tmp/lima/melange \
														--signing-key melange.rsa

vulnerable-awk-playground.tar: packages/aarch64/APKINDEX.json apko.yaml
	apko build \
		--arch aarch64 \
		./apko.yaml \
		vulnerable-awk-playground:apko \
		vulnerable-awk-playground.tar

load-apko-image: vulnerable-awk-playground.tar
	docker load < vulnerable-awk-playground.tar

run-apko: load-apko-image
	docker run --rm -it -p 8080:8080 vulnerable-awk-playground:apko-arm64
