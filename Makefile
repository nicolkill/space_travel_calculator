IMAGE_TAG := nicolkill/space_travel_calculator
REVISION := $(shell git rev-parse --short HEAD)
RUN_STANDARD := docker run --rm -v `pwd`:/app -w /app hexpm/elixir:1.13.4-erlang-25.0-rc3-alpine-3.15.3

all: build image

up:
	docker compose up

build:
	$(RUN_STANDARD) sh -c 'mix do local.rebar --force, local.hex --force, \
		deps.get, \
		deps.compile --force, \
		compile --plt'

image:
	docker build -t ${IMAGE_TAG}:${REVISION} .
	docker tag ${IMAGE_TAG}:${REVISION} ${IMAGE_TAG}:latest

testing:
	docker compose run --rm -e "MIX_ENV=test" app mix test

iex:
	docker compose exec app iex -S mix

bash:
	docker compose run --rm app sh

routes:
	docker compose exec app mix phx.routes

format:
	docker compose exec app mix format

