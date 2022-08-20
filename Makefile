NVIM=XDG_DATA_HOME=${NVIM_BEGINNER}/share XDG_CACHE_HOME=${NVIM_BEGINNER} XDG_CONFIG_HOME=${NVIM_BEGINNER} nvim

profile:
	$(NVIM) -c PackerProfile

install:
	$(NVIM) -c PackerInstall

compile:
	$(NVIM) -c PackerCompile profile=true

clean:
	$(NVIM) -c PackerClean
