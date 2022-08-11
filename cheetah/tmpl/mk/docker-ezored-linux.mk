CONTAINER_NAME= ezored

TAG           = latest
NAME          = ubuntu/ezored
MACHINENAME   = $(NAME):$(TAG)

DOCKER        = docker

HASH          = 39d40bb58aff5e132f9026a59287db1d
BLOB          = 4ee4cb6e6d3cdcd3f6f5d0254d2d154306f0880f
ENTRYPOINT    = wget https://gist.githubusercontent.com/lopesivan/$(HASH)/raw/$(BLOB)/entrypoint.sh
IMAGE_TGZ     = ezored_latest.tar.gz

all: help

.PHONY: help
help:
	@printf "%s\n" "Useful targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  make %-15s\033[0m %s\n", $$1, $$2}'

suexec:
	git clone --branch v0.2 --depth 1 https://github.com/ncopa/su-exec.git && \
		cd su-exec && \
		git switch -c v0.2 && \
		make

entrypoint:
	@(cd su-exec; pwd; $(ENTRYPOINT) )
	chmod +x su-exec/entrypoint.sh

.PHONY: init
init: suexec entrypoint ## config no-root

.PHONY: run
run: ## run interactive
	$(DOCKER) run -it \
		-e USER=`id -u -n` \
		-e GROUP=`id -g -n` \
		-e UID=`id -u` \
		-e GID=`id -g` \
		-e PATH=/home/`id -u -n`/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
		-w /home/`id -u -n` \
		-v `pwd`/host:/home/`id -u -n` \
		-v `pwd`/su-exec/:/opt/bin \
		--name $(CONTAINER_NAME) --rm $(MACHINENAME) \
		bash

ps: ## Shows processes that are running or suspended
	$(DOCKER) ps -a

.PHONY: get-image
get-image: ## Get Image
	scp dev:backup/$(IMAGE_TGZ) .

.PHONY: load-image
load-image: ## Get Image
	$(DOCKER) load < $(IMAGE_TGZ)

.PHONY: linux-host
linux-host: ## Linux Host
	tar xvzf ~/developer/ezored/linux_host.tgz

.PHONY: status
status: ## Show Name, cpu and memory usage per machine
	$(DOCKER) stats --all --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"

info:
	$(DOCKER) inspect -f '{{ index .Config.Labels "build_version" }}' $(MACHINENAME)

pause:
	$(DOCKER) $@ $(CONTAINER_NAME)
unpause:
	$(DOCKER) $@ $(CONTAINER_NAME)

images:
	$(DOCKER) images --format "{{.Repository}}:{{.Tag}}"| sort
ls:
	$(DOCKER) images --format "{{.ID}}: {{.Repository}}"
size:
	$(DOCKER) images --format "{{.Size}}\t: {{.Repository}}"
tags:
	$(DOCKER) images --format "{{.Tag}}\t: {{.Repository}}"| sort -t ':' -k2 -n
net:
	$(DOCKER) network ls
rm-network:
	$(DOCKER) network ls| awk '$$2 !~ "(bridge|host|none)" {print "docker network rm " $$1}' | sed '1d'

rmi:
	docker rmi $(MACHINENAME)

rm-all:
	$(DOCKER) ps -aq -f status=exited| xargs $(DOCKER) rm

stop-all:
	$(DOCKER) ps -aq -f status=running| xargs $(DOCKER) stop

log:
	$(DOCKER) logs -f $(CONTAINER_NAME)

ip:
	$(DOCKER) ps -q \
	| xargs $(DOCKER) inspect --format '{{ .Name }}:{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'\
	| \sed 's/^.*://'

memory:
	$(DOCKER) inspect `$(DOCKER) ps -aq` | grep -i mem

fix:
	$(DOCKER) images -q --filter "dangling=true"| xargs $(DOCKER) rmi -f

stop:
	$(DOCKER) stop $(CONTAINER_NAME)

rm:
	$(DOCKER) rm $(CONTAINER_NAME)

exec:
	$(DOCKER) exec -it $(CONTAINER_NAME) /bin/sh

restart:
	$(DOCKER) restart $(CONTAINER_NAME)

.PHONY: clean
clean: stop rm ## remove shut down the container and remove

