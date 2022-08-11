%.lua: %.fnl fennel
	./fennel --compile $< > $@
