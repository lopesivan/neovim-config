NAME     = cansi.state
PRIORITY = 1999
COMMAND  = command.py

install:
	sudo update-alternatives --install /usr/local/bin/$(NAME) $(NAME) $(PWD)/$(COMMAND) $(PRIORITY)

uninstall:
	sudo update-alternatives --remove-all $(NAME)

