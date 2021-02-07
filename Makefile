build:
	docker build . -t local/nomad:dev

run: build
	docker run \
	  --rm -ti --name nomad-dev \
	  local/nomad:dev agent -dev
