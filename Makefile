build-all-in-one:
	docker build . -t vulnerable-awker:all-in-one -f dockerfiles/Dockerfile.all-in-one

run-all-in-one:
	docker run --rm -it -p 8080:8080 vulnerable-awker:all-in-one
