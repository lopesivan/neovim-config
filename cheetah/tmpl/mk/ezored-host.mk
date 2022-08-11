.PHONY: help clone config prepare build run

CONAN_ADD_REMOTE     = remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan
CONAN_PROFILE_UPDATE = profile update settings.compiler.libcxx=libstdc++11 default

MY_PATCHES_REMOTE    = https://raw.githubusercontent.com/lopesivan/my_patches/main
PATCH_NAME           = ezored
DIFF                 = ezored-makefile-20220729-795f5bc.diff

APP = linux_alpha

all: help

help:
	@printf "%s\n" "Useful targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  make %-15s\033[0m %s\n", $$1, $$2}'

clone: ## Clone repo
	git clone https://github.com/ezored/ezored
patch:
	wget "$(MY_PATCHES_REMOTE)/$(PATCH_NAME)/$(DIFF)"
	echo `tput bold tput setb 3`Applying patch`tput setaf 3` "$(DIFF)..."  `tput sgr0`
	(cd ezored; patch -Np1 -i "../$(DIFF)")

config: ## Configure conan end install python dependence
	@( cd ezored; \
	pip install conan --upgrade;  \
	conan $(CONAN_ADD_REMOTE);  \
	pip install -r requirements.txt;  \
	python make.py conan setup;  \
	conan $(CONAN_PROFILE_UPDATE); )

prepare: ## Prepare for build
	@( cd ezored; \
	python make.py target $(APP) prepare )

build: ## Build
	@( cd ezored; \
	python make.py target $(APP) build )

run: ## Run
	@( cd ezored; \
	bash run.sh)
