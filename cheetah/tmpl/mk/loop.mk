apps =  app1 app2 app3 app4

all: $(apps)

$(apps):
	@echo $@

