# docker pull registry.local:5000/softsam/android-16:latest
CONTAINER_NAME= android

TAG           = latest
# NAME          = softsam/android-16
# NAME          = softsam/android-17
# NAME          = softsam/android-19
# NAME          = softsam/android-20
# NAME          = softsam/android-21
# NAME          = softsam/android-22
NAME          = softsam/android-23
MACHINENAME   = registry.local:5000/$(NAME):$(TAG)

DOCKER        = docker

all: help

.PHONY: help
help:
	@printf "%s\n" "Useful targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  make %-15s\033[0m %s\n", $$1, $$2}'

ps: ## Shows processes that are running or suspended
	$(DOCKER) ps -a

.PHONY: status
status: ## Show Name, cpu and memory usage per machine
	$(DOCKER) stats --all --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"

info:
	$(DOCKER) inspect -f '{{ index .Config.Labels "build_version" }}' $(MACHINENAME):$(TAG)

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
run:
	$(DOCKER) run -it --rm --device /dev/kvm $(MACHINENAME) bash
targets:
	$(DOCKER) run -it --rm --device /dev/kvm $(MACHINENAME) tools/bin/avdmanager list target
restart:
	$(DOCKER) restart  $(CONTAINER_NAME)

.PHONY: clean
clean: stop rm ## remove shut down the container and remove

